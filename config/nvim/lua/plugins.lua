vim.cmd [[
  packadd nvim-lspconfig
  packadd nvim-treesitter
  packadd copilot.vim
]]

local lspconfig = require("lspconfig")
local treesitter = require("nvim-treesitter.configs")
local command = vim.api.nvim_create_user_command

-- Treesitter
treesitter.setup {
  highlight = {enable = true},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>s",
      node_incremental = "<leader>i",
      node_decremental = "<leader>o"
    }
  },
  indent = {enable = true, disable = {"ruby"}}
}

-- LSP
lspconfig.ts_ls.setup {}
lspconfig.eslint.setup {}
lspconfig.tailwindcss.setup {}
lspconfig.solargraph.setup {}
lspconfig.lua_ls.setup {}
lspconfig.gopls.setup {}
lspconfig.clangd.setup {
  cmd = {
    "clangd", "--offset-encoding=utf-16", "--background-index",
    "--all-scopes-completion", "--suggest-missing-includes", "--pretty",
    "--header-insertion-decorators", "--function-arg-placeholders",
    "--completion-style=detailed"
  },
  -- init_options = {fallbackFlags = {'-std=c++17'}}
}

local function toggle_diagnostics()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    -- Disable LSP semantic highlighting
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

-- Disable Copilot in some filetypes
vim.g.copilot_filetypes = {text = false}
