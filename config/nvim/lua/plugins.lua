local lspconfig = require("lspconfig")
local treesitter = require("nvim-treesitter.configs")
local command = vim.api.nvim_create_user_command

-- Treesitter
treesitter.setup {
  highlight = {enable = true},
  incremental_selection = {enable = true},
  indent = {enable = true}
}

-- LSP
lspconfig.ts_ls.setup {}
lspconfig.solargraph.setup {}
lspconfig.lua_ls.setup {}
lspconfig.gopls.setup {}
lspconfig.clangd.setup {}

local function toggle_diagnostics()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    -- Disable diagnostics on attach
    vim.diagnostic.enable(false)
    command("ToggleDiagnostics", toggle_diagnostics, {})
    vim.keymap.set("n", "<leader>td", toggle_diagnostics)

    -- LSP mappings
    vim.keymap.set("n", "gca", vim.lsp.buf.code_action)
    vim.keymap.set("n", "grr", vim.lsp.buf.references)
    vim.keymap.set("i", "<C-Space>", "<C-x><C-o>")
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
  end,
})
