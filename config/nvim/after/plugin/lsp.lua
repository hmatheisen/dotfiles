local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')
local cmp = require('cmp')

-- LSP servers to start
local servers = { 'solargraph', 'tsserver' }

for _, server in ipairs(servers) do
  lspconfig[server].setup{
    capabilities = capabilities
  }
end

-- Vim config
vim.opt.completeopt = "menu,menuone,noselect"

-- Default completion
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'nvim_lua' },
  }, {
    { name = 'buffer' },
  }),
  view = {
    entries = "native"
  }
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  },
  view = {
    entries = "wildmenu"
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  view = {
    entries = "wildmenu"
  }
})
