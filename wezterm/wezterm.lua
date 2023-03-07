local wezterm = require("wezterm")

wezterm.on("window-config-reloaded", function(window, pane)
	wezterm.log_info("the config was reloaded for this window!")
end)
wezterm.on("window-focus-changed", function()
	os.execute(
		"xdotool search -classname org.wezfurlong.wezterm | xargs -I{} xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id {}"
	)
end)

return {
	warn_about_missing_glyphs = false,
	window_padding = {
		left = 7,
		right = 0,
		top = 25,
		bottom = 0,
	},
	color_scheme = "Catppuccin Frappe",
	colors = {
		background = "black",
	},
	scrollback_lines = 99999,
	harfbuzz_features = { "zero" },
	hide_tab_bar_if_only_one_tab = false,
	enable_tab_bar = false,
	font_size = 16.0,
	freetype_load_target = "Light",
	freetype_render_target = "HorizontalLcd",
	underline_position = "-13px",
	underline_thickness = "1px",
	freetype_load_flags = "NO_HINTING|MONOCHROME",
	line_height = 1.9,
	max_fps = 90,
	window_background_opacity = 0.8,
	window_close_confirmation = "NeverPrompt",
	font = wezterm.font_with_fallback({
		"ComicCode Nerd Font",
		"青鸟华光简隶变",
		"FiraCode Nerd Font Mono",
		"Maple Mono",
		"DengXian",
	}),
	font_rules = {
		{
			-- 粗斜体
			intensity = "Bold",
			italic = true,
			font = wezterm.font({
				family = "FiraCode Nerd Font Mono",
				weight = "Bold",
				style = "Italic",
			}),
		},
		{
			italic = true,
			intensity = "Half",
			font = wezterm.font({
				family = "JetBrainsMono Nerd Font Mono",
				weight = "DemiBold",
				style = "Italic",
			}),
		},
		{
			italic = true,
			intensity = "Normal",
			font = wezterm.font({
				family = "Maple Mono",
				style = "Italic",
			}),
		},
	},
	keys = require("key-bind").keyBind(),
	default_cursor_style = "BlinkingBar",
	adjust_window_size_when_changing_font_size = false,
}
