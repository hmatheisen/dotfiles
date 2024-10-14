require("options")
require("mappings")
require("commands")

if vim.fn.isdirectory("pack") then require("plugins") end
