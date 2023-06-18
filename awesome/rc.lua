pcall(require, "luarocks.loader")
local awful = require("awful")
awful.spawn.with_shell("killall bash")
local gears = require("gears")
local gfs = require("gears.filesystem")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
local wibox = require("wibox")
local beautiful = require("beautiful")
local bling = require("bling")

beautiful.init(gfs.get_configuration_dir() .. "theme/theme.lua")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")
--require("config.titlebar")
require("config.key")
require("config.bar")
require("config.menu")
require("signal")

bling.module.flash_focus.enable()

if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Error occured",
		text = awesome.startup_errors,
	})
end

local theme_path = string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME"), "default")
beautiful.init(theme_path)

awful.spawn.with_shell("bash ~/.config/awesome/shell/autostart.sh")
-- keyd have issue in here
awful.spawn.with_shell("setxkbmap -option caps:swapescape")

--awful.screen.connect_for_each_screen(function(s)
--	bling.module.tiled_wallpaper("O", s, {
--		fg = "#828da1",
--		bg = "#1b1f27",
--		offset_y = 20,
--		offset_x = 20,
--		font = "Sarasa Mono K Bold",
--		font_size = 8,
--		padding = 100,
--		zickzack = true,
--	})
--end)

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
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

root.keys(globalkeys)

-- rules

awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_offscreen + awful.placement.centered,
		},
	},

	-- Floating clients.
	{
		rule_any = {
			class = {
				"Arandr",
				"Blueberry.py",
				"qBittorrent",
				"Gpick",
				"Yad",
				"icalingua",
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
				"xtightvncviewer",
			},
		},
		properties = { floating = true },
	},

	{
		rule_any = { type = { "normal", "dialog" } },
		properties = {
			titlebars_enabled = true,
			placement = awful.placement.centered,
		},
	},

	{
		rule_any = {
			instance = { "tim.exe", "qq.exe", "wechat.exe", "wemeetapp", "uTools" },
		},
		properties = {
			-- This, together with myfocus_filter, make the popup menus flicker taskbars less
			-- Non-focusable menus may cause TM2013preview1 to not highlight menu
			-- items on hover and crash.
			focusable = true,
			floating = true,
			-- 去掉边框
			border_width = 0,
			placement = awful.placement.no_offscreen,
		},
	},
	--{
	--  rule_any = {
	--    instance = {'netease-cloud-music'},
	--  },
	--  properties = {
	--    focusable = false,
	--    floating = true,
	--    border_width = 0,
	--    tags = {"a", "s", "d", "f", "i","o","p"},
	--    skip_taskbar = true,
	--    ontop = true,
	--    placement = awful.placement.no_offscreen
	--  }
	--},
	{
		-- music
		rule_any = {
			instance = { "lx-music-desktop", "listen1" },
		},
		properties = {
			floating = true,
			border_width = 0,
			skip_taskbar = true,
			placement = awful.placement.no_offscreen,
		},
	},
	{
		rule_any = {
			instance = { "Clash for Windows", "clash for windows" },
		},
		properties = {
			minimized = true,
		},
	},
}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	c.shape = function(cr, w, h)
		gears.shape.rounded_rect(cr, w, h, 10)
	end
end)

-- Enable sloppy focus, so that focus follows mouse.
-- client.connect_signal("mouse::enter", function(c)
--     c:emit_signal("request::activate", "mouse_enter", {raise = true})
-- end)

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
	c.opacity = 1
end)

client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
	c.opacity = 1
end)

-- }}}
require("config.pwidget")
--require("config.initwidget")

--client.connect_signal("property::position", function(c)
--  --naughty.notify {text = "坐标发生改变"}
--  if c.floating then
--    M[c.class] = {x=c.x,y=c.y}
--  end
--end)
--
--client.connect_signal("property::size", function(c)
--  --naughty.notify {text = "大小发生改变" .. c.width}
--  if c.floating then
--    M[c.class] = {width=c.width,height=c.height}
--  end
--end)
--
--
--
client.connect_signal("property::floating", function(c)
	--if c.maximized or c.fullscreen then return end
	--naughty.notify { text = c.floating and "floating" or "not floating" }
	--if c.floating and c.class == 'listen1' then
	--  c.border_width = 0
	--end
end)
