local wezterm = require "wezterm"
local config = {}

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 14.0
config.color_scheme = 'One Dark (Gogh)'
config.window_background_opacity = 0.97
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.enable_tab_bar = false


return config
