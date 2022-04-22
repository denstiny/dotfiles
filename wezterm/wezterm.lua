
local wezterm = require 'wezterm';

-- window resize event config
--require("wezterm-resize-config")

-- key
require("key-bind")

-- A helper function for my fallback fonts

function font_with_fallback(name, params)
    local names = {name, "DengXian","Noto Color Emoji", "JetBrains "}
    return wezterm.font_with_fallback(names, params)
end


wezterm.on("window-config-reloaded", function(window, pane)
  wezterm.log_info("the config was reloaded for this window!");
end)


return {
    warn_about_missing_glyphs=false,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    },
    color_scheme = "Lavandula",
    scrollback_lines=99999,
    harfbuzz_features = {"zero"},
    hide_tab_bar_if_only_one_tab = false,
    enable_tab_bar = false,
    freetype_load_target = "Light",
    font_size = 16.0,
    freetype_render_target = "HorizontalLcd",
    font = font_with_fallback("Fira Code Nerd Font"),
    font_rules= {
        -- Select a fancy italic font for italic text
        {
            italic = true,
            font = font_with_fallback("UbuntuMono Nerd Font",{italic=true}),
        },

        -- Similarly, a fancy bold+italic font
        {
            italic = true,
            intensity = "Bold",
            font = font_with_fallback("Operator Mono Lig",{bold=true,italic=true}),
        },

        -- Make regular bold text a different color to make it stand out even more
        {
            intensity = "Bold",
            font = font_with_fallback("Fira Code Nerd Font", {bold=true}),
        },

        -- For half-intensity text, use a lighter weight font
        {
            intensity = "Half",
            font = font_with_fallback("Fira Code Nerd Font"),
        },
    },
    keys = keyBind()
}

