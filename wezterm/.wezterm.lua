local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- No padding
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.color_scheme = "Tokyo Night"
config.font = wezterm.font("JetBrains Mono", { weight = "Medium" })
config.font_size = 14.0
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

config.colors = {
	tab_bar = {
		background = "#1a1b26",
		active_tab = {
			bg_color = "#7aa2f7",
			fg_color = "#1a1b26",
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#292e42",
			fg_color = "#545c7e",
		},
		inactive_tab_hover = {
			bg_color = "#292e42",
			fg_color = "#7aa2f7",
		},
	},
}

-- Cursor
config.cursor_blink_rate = 700

-- Window decorations
config.window_decorations = "TITLE"

-- Remove window close confirmation
config.window_close_confirmation = "NeverPrompt"

config.keys = {
	-- SPLIT PANES
	{ key = "d", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },

	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },

	{ key = "LeftArrow", mods = "CTRL|ALT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "CTRL|ALT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	{ key = "UpArrow", mods = "CTRL|ALT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "DownArrow", mods = "CTRL|ALT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },

	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },

	{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },

	-- Go to specific tab
	{ key = "1", mods = "ALT", action = wezterm.action.ActivateTab(0) },
	{ key = "2", mods = "ALT", action = wezterm.action.ActivateTab(1) },
	{ key = "3", mods = "ALT", action = wezterm.action.ActivateTab(2) },
	{ key = "4", mods = "ALT", action = wezterm.action.ActivateTab(3) },
	{ key = "5", mods = "ALT", action = wezterm.action.ActivateTab(4) },

	-- FULLSCREEN
	{ key = "F", mods = "ALT", action = wezterm.action.ToggleFullScreen },

	-- Zoom pane (toggle maximize current pane)
	{ key = "z", mods = "CTRL|SHIFT", action = wezterm.action.TogglePaneZoomState },

	-- Copy/Paste (standard Linux)
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
}

return config
