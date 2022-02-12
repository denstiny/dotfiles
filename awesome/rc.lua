pcall(require, "luarocks.loader")

local gears = require("gears")
local gfs = require("gears.filesystem")
local awful = require("awful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
local wibox = require("wibox")
local beautiful = require("beautiful")
local bling = require("bling")

beautiful.init(gfs.get_configuration_dir() .. "theme/theme.lua")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")
require("config.titlebar")
require("config.key")
require("config.bar")
require("config.menu")


bling.module.flash_focus.enable()

if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Error occured",
                     text = awesome.startup_errors })
end


local theme_path = string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME"), "default")
beautiful.init(theme_path)


awful.screen.connect_for_each_screen(function(s)  
  bling.module.tiled_wallpaper("O", s, {       
      fg = "#828da1", 
      bg = "#1b1f27", 
      offset_y = 20,  
      offset_x = 20,  
      font = "Sarasa Mono K Bold",
      font_size = 8, 
      padding = 100,   
      zickzack = true  
  	})
end)

awful.spawn.with_shell("~/.config/awesome/autostart.sh")

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
  bling.layout.centered,
  awful.layout.suit.tile,
  awful.layout.suit.floating,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top,
}

clientbuttons = gears.table.join(
  awful.button({ }, 1, function (c)
      c:emit_signal("request::activate", "mouse_click", {raise = true})
  end),
  awful.button({ modkey }, 1, function (c)
      c:emit_signal("request::activate", "mouse_click", {raise = true})
      awful.mouse.client.move(c)
  end),
  awful.button({ modkey }, 3, function (c)
      c:emit_signal("request::activate", "mouse_click", {raise = true})
      awful.mouse.client.resize(c)
  end)
)

root.keys(globalkeys)

-- rules

awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        class = {
          "Arandr",
		  "Blueberry.py",
          "mpv",
          "Gpick",
		  "Yad",
          "Kruler",
          "MessageWin", 
          "MPlayer",
		  "Pavucontrol",
          "Sxiv",
          "Wpa_gui",
		  "nodeTreeGui",
		  "Main",
          "pinentry",
          "veromix",
          "xtightvncviewer"},
	}, properties = { floating = true }},

    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },

    { rule = { instance = "surf" },
      properties = {screen = 1,tags = {"1","2","3","4","5","6","7"},
                    floating = true,below=true ,x =0,y=0,maximized=true,fullscreen=true} 
    },
}


-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
  c.shape = function(cr,w,h)
      gears.shape.rounded_rect(cr,w,h,10)
  end
end)

-- Enable sloppy focus, so that focus follows mouse.
-- client.connect_signal("mouse::enter", function(c)
--     c:emit_signal("request::activate", "mouse_enter", {raise = true})
-- end)

client.connect_signal("focus", function(c) 
    c.border_color = beautiful.border_focus 
    c.opacity = 0.9
end)

client.connect_signal("unfocus", function(c) 
    c.border_color = beautiful.border_normal 
    c.opacity = 0.96
end)
-- }}}
