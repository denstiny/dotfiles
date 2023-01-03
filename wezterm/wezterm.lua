local wezterm = require 'wezterm';

-- window resize event config
--require("wezterm-resize-config")

-- key
require("key-bind")

-- A helper function for my fallback fonts

function font_with_fallback(name, params)
  local names = { name, "DengXian", "Noto Color Emoji", "JetBrains " }
  return wezterm.font_with_fallback(names, params)
end

wezterm.on("window-config-reloaded", function(window, pane)
  wezterm.log_info("the config was reloaded for this window!");
end)


return {
  warn_about_missing_glyphs = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 11,
    bottom = 0
  },
  color_scheme = "Lavandula",
  scrollback_lines = 99999,
  harfbuzz_features = { "zero" },
  hide_tab_bar_if_only_one_tab = false,
  enable_tab_bar = false,
  font_size = 16.0,
  freetype_load_target = "Light",
  freetype_render_target = "HorizontalLcd",
  underline_position = "-13px",
  underline_thickness = "2px",
  freetype_load_flags = 'NO_HINTING|MONOCHROME',
  line_height = 1.9,
  max_fps = 90,
  keys = keyBind(),
  window_close_confirmation = "NeverPrompt",
  font = font_with_fallback("ComicCode Nerd Font"),
  font_rules = {
    {
      intensity = 'Bold',
      italic = true,
      font = wezterm.font {
        family = 'VictorMono Nerd Font',
        weight = 'Bold',
        style = 'Italic',
      },
    },
    {
      italic = true,
      intensity = 'Half',
      font = wezterm.font {
        family = 'VictorMono Nerd Font',
        weight = 'DemiBold',
        style = 'Italic',
      },
    },
    {
      italic = true,
      intensity = 'Normal',
      font = wezterm.font {
        family = 'UbuntuMono Nerd Font Mono',
        style = 'Italic',
      },
    },
  },
}
