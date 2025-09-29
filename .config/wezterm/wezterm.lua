local wezterm = require("wezterm")
local act = wezterm.action

return {
	color_scheme = "One Dark (Gogh)",

	-- General appearance
	font = wezterm.font_with_fallback({
		"JetBrains Mono",
		"Fira Code",
	}),
	font_size = 13.0,
	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },

	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	window_background_opacity = 0.99,
	enable_tab_bar = false, -- hides the tab bar

	-- Keybindings
	keys = {
		-- New tab (CTRL+i)
		{ key = "w", mods = "CTRL", action = act.SpawnTab("DefaultDomain") },

		-- Splits
		{ key = "v", mods = "CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

		-- Pane navigation (Alt + Vim keys)
		{ key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
		{ key = "l", mods = "ALT", action = act.ActivatePaneDirection("Right") },
		{ key = "k", mods = "ALT", action = act.ActivatePaneDirection("Up") },
		{ key = "j", mods = "ALT", action = act.ActivatePaneDirection("Down") },

		-- Close current pane
		{ key = "q", mods = "CTRL", action = act.CloseCurrentPane({ confirm = true }) },

		-- Cycle tabs (even without tab bar visible!)
		{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
	},
}
