return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp'
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- C/C++
      lspconfig.clangd.setup { capabilities = capabilities }

      -- Web
      lspconfig.solargraph.setup { capabilities = capabilities }
      lspconfig.tsserver.setup { capabilities = capabilities }

      -- Neovim
      lspconfig.lua_ls.setup { capabilities = capabilities }

      vim.diagnostic.config({ virtual_text = false })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")

      cmp.setup {
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
        })
      }
    end
  },
}
