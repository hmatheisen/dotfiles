return {
  {
    "neovim/nvim-lspconfig",
    dependencies = "hrsh7th/cmp-nvim-lsp",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require('lspconfig')

      -- Servers config
      lspconfig.tsserver.setup { capabilities = capabilities }
      lspconfig.solargraph.setup { capabilities = capabilities }
      lspconfig.gopls.setup { capabilities = capabilities }
      lspconfig.omnisharp.setup {
        cmd = { "dotnet", "/Users/henry/.local/omnisharp/OmniSharp.dll" },
        capabilities = capabilities
      }

      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
            diagnostics = { globals = { 'vim' } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false
            },
            telemetry = {
              enable = false,
            },
          }
        },
        capabilities = capabilities
      }

      lspconfig.clangd.setup {
        cmd = {
          "/opt/homebrew/opt/llvm/bin/clangd",
          "--background-index",
          "--clang-tidy",
          "--all-scopes-completion",
          "--pretty",
          "--inlay-hints",
          "--header-insertion-decorators",
          "--completion-style=detailed",
          "--pch-storage=memory",
          "--pretty",
          "-j=4",
          "--function-arg-placeholders",
        },
        capabilities = capabilities
      }

      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Buffer local mappings.
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
          vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<C-f>', function() vim.lsp.buf.format { async = true } end, opts)
        end,
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require 'cmp'

      -- Default completion
      cmp.setup({
        snippet = {
          expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
          ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'path' },
          { name = 'ultisnips' },
          {
            name = 'buffer',
            option = {
              get_bufnrs = function() return vim.api.nvim_list_bufs() end
            }
          },
        })
      })

      -- Use buffer source for `/` and `?`
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        },
        view = { entries = "wildmenu" }
      })

      -- Use cmdline & path source for ':'
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
          { name = 'cmdline' }
        }),
        view = { entries = "wildmenu" }
      })
    end
  },                                     -- Autocompletion plugin
  "hrsh7th/cmp-nvim-lsp",                -- LSP source for nvim-cmp
  "hrsh7th/cmp-buffer",                  -- Buffer source for nvim-cmp
  "hrsh7th/cmp-path",                    -- Path source for nvim-cmp
  "hrsh7th/cmp-cmdline",                 -- nvim-cmp source for vim",s cmdline
  "hrsh7th/cmp-nvim-lua",                -- nvim lua api
  "hrsh7th/cmp-nvim-lsp-signature-help", -- Signature help
  "quangnguyen30192/cmp-nvim-ultisnips", -- nvim-cmp source for ultisnips
}
