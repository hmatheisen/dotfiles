require('zen-mode').setup {
  window = {
    width = 80, -- width of the Zen window
    options = {
      number = false, -- disable number column
      relativenumber = false, -- disable relative numbers
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = true,
      showcmd = false
    },
    tmux = { enabled = true }, -- disables the tmux statusline
    -- this will change the font size on alacritty when in zen mode
    -- requires  Alacritty Version 0.10.0 or higher
    -- uses `alacritty msg` subcommand to change font size
    alacritty = {
      enabled = true,
      font = "20", -- font size
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
}
