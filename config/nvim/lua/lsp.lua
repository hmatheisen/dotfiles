local lsp = vim.lsp
local command = vim.api.nvim_create_user_command
local autocmd = vim.api.nvim_create_autocmd

-- Requires 'https://github.com/neovim/nvim-lspconfig' to be installed
-- vim.lsp.enable('solargraph')
vim.lsp.enable('ruby_lsp')
vim.lsp.enable('lua_ls')

local function toggle_diagnostics()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

autocmd('LspAttach', {
  callback = function(args)
    -- Disable semantic providers
    -- local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- client.server_capabilities.semanticTokensProvider = nil

    -- Disable diagnostics on attach
    vim.diagnostic.enable(false)
    command("ToggleDiagnostics", toggle_diagnostics, {})
    vim.keymap.set("n", "<leader>td", toggle_diagnostics)

    -- LSP mappings
    vim.keymap.set("n", "gca", vim.lsp.buf.code_action)
    vim.keymap.set("n", "grr", vim.lsp.buf.references)
    vim.keymap.set("n", "grn", vim.lsp.buf.rename)
    vim.keymap.set("i", "<C-Space>", "<C-x><C-o>")
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
  end
})
