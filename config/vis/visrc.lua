-- load standard vis module, providing parts of the Lua API
require("vis")

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
	vis:map(vis.modes.NORMAL, " ", ":")
	vis:map(vis.modes.VISUAL, " ", ":")
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	vis:command("set autoindent")
	vis:command("set change-256colors")
	vis:command("set escdelay 0")
	vis:command("set ignorecase")
	vis:command("set relativenumbers")
	vis:command("set theme dark-16")
	vis:command("set cursorline")
	vis:command("set expandtab")
	vis:command("set tabwidth 2")

	use_tabs = { "c", "lua" }
	for _, lang in ipairs(use_tabs) do
		if win.syntax == lang then
			vis:command("set expandtab off")
			vis:command("set tabwidth 4")
		end
	end
end)
