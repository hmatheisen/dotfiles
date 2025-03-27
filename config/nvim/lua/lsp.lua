local lsp = vim.lsp
local command = vim.api.nvim_create_user_command
local autocmd = vim.api.nvim_create_autocmd

lsp.config["clangd"] = {
  cmd = { "clangd", "--background-index" }
}

lsp.config["solargraph"] = {
  cmd = { "solargraph", "stdio" }
}

lsp.enable("clangd")
lsp.enable("solargraph")

local function toggle_diagnostics()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

autocmd('LspAttach', {
  callback = function(args)
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
