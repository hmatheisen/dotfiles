-- load standard vis module, providing parts of the Lua API
require("vis")

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	vis:command("set autoindent")
	vis:command("set escdelay 0")
	vis:command("set ignorecase")
	vis:command("set relativenumbers")
	vis:command("set expandtab")
	vis:command("set tabwidth 2")

	use_tabs = { "ansi_c", "makefile", "go", "lua" }
	for _, lang in ipairs(use_tabs) do
		if win.syntax == lang then
			vis:command("set expandtab off")
			vis:command("set tabwidth 4")
		end
	end

	show_cursor_column = { "ansi_c", "makefile" }
	for _, lang in ipairs(show_cursor_column) do
		if win.syntax == lang then
			vis:command("set cursorcolumn 80")
		end
	end
end)
