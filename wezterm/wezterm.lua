local wezterm = require 'wezterm';

wezterm.on("window-config-reloaded", function(window, pane)
  wezterm.log_info("the config was reloaded for this window!");
end)


return {
  warn_about_missing_glyphs = false,
  window_padding = {
    left = 5,
    right = 0,
    top = 11,
    bottom = 0
  },
  color_scheme = "Lavandula",
  scrollback_lines = 99999,
  harfbuzz_features = { "zero" },
  hide_tab_bar_if_only_one_tab = false,
  enable_tab_bar = false,
  font_size = 14.0,
  freetype_load_target = "Light",
  freetype_render_target = "HorizontalLcd",
  underline_position = "-11px",
  underline_thickness = "2px",
  freetype_load_flags = 'NO_HINTING|MONOCHROME',
  line_height = 1.9,
  max_fps = 90,
  window_close_confirmation = "NeverPrompt",
  font = wezterm.font_with_fallback {
    'ComicCode Nerd Font',
    '岁岁余年拼音体',
    'FiraCode Nerd Font Mono',
    'DengXian',
  },
  font_rules = {
    {
      -- 粗斜体
      intensity = 'Bold',
      italic = true,
      font = wezterm.font {
        family = 'JetBrainsMono Nerd Font Mono',
        weight = 'Bold',
        style = 'Italic',
      },
    },
    {
      italic = true,
      intensity = 'Half',
      font = wezterm.font {
        family = 'JetBrainsMono Nerd Font Mono',
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
  keys = require('key-bind').keyBind()
}
