-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Ayu Mirage (Gogh)"

config.font = wezterm.font("Hack Nerd Font")
config.font_size = 11
-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.window_padding = {
	left = 3,
	right = 3,
	top = 3,
	bottom = 3,
}
config.window_background_opacity = 0.5

config.window_decorations = "NONE"

config.initial_rows = 60
config.initial_cols = 200

config.enable_kitty_graphics = true
-- and finally, return the configuration to wezterm
return config
