local wezterm = require 'wezterm';
local M = {}
function M.keyBind()
  keys = {
    { key = "k", mods = "CTRL|SHIFT", action = wezterm.action { ScrollByPage = -1 } },
    { key = "j", mods = "CTRL|SHIFT", action = wezterm.action { ScrollByPage = 1 } },
    { key = "k", mods = "CTRL", action = wezterm.action { ScrollByLine = -1 } },
    { key = "j", mods = "CTRL", action = wezterm.action { ScrollByLine = 1 } },
    { key = "f", mods = "CTRL", action = wezterm.action { Search = { CaseSensitiveString = "" } } },
    { key = "=", mods = "CTRL", action = "ResetFontSize" },
    { key = "+", mods = "CTRL", action = "IncreaseFontSize" },
    { key = "-", mods = "CTRL", action = "DecreaseFontSize" }
  }
  return keys
end

return M
