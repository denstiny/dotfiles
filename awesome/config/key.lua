local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget
require("awful.hotkeys_popup.keys")
require("awful.autofocus")

modkey = "Mod4"
altkey = "Mod1"

rofi_theme = "rofi" -- rofi theme  [' rofi ','rofi-default']
mykeyboardlayout = awful.widget.keyboardlayout()

root.buttons(gears.table.join(awful.button({}, 3, function()
	mymainmenu:toggle()
end)))

globalkeys = gears.table.join(
	awful.key({ modkey }, "x", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	awful.key({ modkey }, "z", function()
		mymainmenu:show()
	end, { description = "show main menu", group = "awesome" }),

	awful.key({ modkey, "Shift" }, "e", awesome.quit, { description = "quit awesome", group = "awesome" }),
	awful.key({ modkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),

	-- Audio
	awful.key({ modkey }, "F1", function()
		awful.spawn.easy_async_with_shell("amixer -q -D pulse sset Master toggle", function()
			awesome.emit_signal("toggle down the volume")
		end)
	end, { description = "raise volume by 5%", group = "audio" }),
	awful.key({}, "XF86AudioMute", function()
		awful.spawn.easy_async_with_shell("amixer -q -D pulse sset Master toggle", function()
			awesome.emit_signal("toggle down the volume")
		end)
	end, { description = "raise volume by 5%", group = "audio" }),
	awful.key({ modkey }, "F3", function()
		awful.spawn.easy_async_with_shell("pactl set-sink-volume @DEFAULT_SINK@ +5%", function()
			awesome.emit_signal("volume_refresh")
		end)
	end, { description = "raise volume by 5%", group = "audio" }),
	awful.key({ modkey }, "F2", function()
		awful.spawn.easy_async_with_shell("pactl set-sink-volume @DEFAULT_SINK@ -5%", function()
			awesome.emit_signal("volume_refresh")
		end)
	end, { description = "lower volume by 5%", group = "audio" }),
	awful.key({}, "XF86AudioRaiseVolume", function() -- 音乐旋钮 左旋转
		awful.spawn.easy_async_with_shell("pactl set-sink-volume @DEFAULT_SINK@ +1%", function()
			awesome.emit_signal("volume_refresh")
		end)
	end, { description = "raise volume by 5%", group = "audio" }),
	awful.key({}, "XF86AudioLowerVolume", function() -- 音乐旋钮 右旋转
		awful.spawn.easy_async_with_shell("pactl set-sink-volume @DEFAULT_SINK@ -1%", function()
			awesome.emit_signal("volume_refresh")
		end)
	end, { description = "lower volume by 5%", group = "audio" }),
	-- Brightness
	awful.key({ modkey }, "XF86AudioLowerVolume", function()
		awful.spawn.easy_async_with_shell("bash ~/.config/awesome/shell/xback.sh 0", function()
			awesome.emit_signal("volume_refresh")
		end)
	end, { description = "Set the brightness to improve", group = "brightness" }),
	awful.key({ modkey }, "XF86AudioRaiseVolume", function()
		awful.spawn.easy_async_with_shell("bash ~/.config/awesome/shell/xback.sh 1", function()
			awesome.emit_signal("volume_refresh")
		end)
	end, { description = "Set the brightness to reduce", group = "brightness" }),
	awful.key({}, "XF86MonBrightnessDown", function()
		awful.spawn.easy_async_with_shell("bash ~/.config/awesome/shell/xback.sh 0", function()
			awesome.emit_signal("volume_refresh")
		end)
	end, { description = "Set the brightness to improve", group = "brightness" }),
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.spawn.easy_async_with_shell("bash ~/.config/awesome/shell/xback.sh 1", function()
			awesome.emit_signal("volume_refresh")
		end)
	end, { description = "Set the brightness to reduce", group = "brightness" }),
	awful.key({ modkey }, "F4", function()
		awful.spawn.easy_async_with_shell("bash ~/.config/awesome/shell/xback.sh 0", function()
			awesome.emit_signal("volume_refresh")
		end)
	end, { description = "Set the brightness to improve", group = "brightness" }),
	awful.key({ modkey }, "F5", function()
		awful.spawn.easy_async_with_shell("bash ~/.config/awesome/shell/xback.sh 1", function()
			awesome.emit_signal("volume_refresh")
		end)
	end, { description = "Set the brightness to reduce", group = "brightness" }),
	-- lock screen
	awful.key({ modkey }, "u", function()
		awful.spawn.easy_async_with_shell("bash ~/.config/awesome/shell/lock.sh")
	end, { description = "Screen lock screen" }),
	-- emacs client
	awful.key({ modkey, "Shift" }, "Return", function()
		awful.spawn.easy_async_with_shell('emacsclient -c -a "emacs"')
	end, { description = "start emasc client" }),
	-- swap screen
	awful.key({ modkey, "Control" }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "A monitor switch" }),

	awful.key({ modkey, "Control" }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "A monitor switch" }),
	-- Standard program
	awful.key({ modkey }, "Return", function()
		awful.spawn(terminal)
	end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey, "Shift" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "e", awesome.quit, { description = "quit awesome", group = "awesome" }),
	awful.key({ modkey }, "e", function()
		awful.util.spawn("flameshot gui")
	end, { description = "take screenshot", group = "screen" }),

	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),

	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),
	-- Menubar
	awful.key({ modkey }, "q", function()
		awful.util.spawn("rofi -theme ~/.config/awesome/rofis/" .. rofi_theme .. "/config.rasi  -show drun")
	end, { description = "show the menubar", group = "rofi apps" }),
	awful.key({ modkey }, "w", function()
		awful.util.spawn("rofi -theme ~/.config/awesome/rofis/" .. rofi_theme .. "/config.rasi -show window")
	end, { description = "show the window", group = "rofi window" }),
	awful.key({ modkey }, "r", function()
		awful.util.spawn("rofi -theme ~/.config/awesome/rofis/" .. rofi_theme .. "/config.rasi -show run")
	end, { description = "show the run", group = "rofi run" })
)

clientkeys = gears.table.join(
	awful.key({ modkey }, "g", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),
	awful.key({ modkey, "Shift" }, "q", function(c)
		c:kill()
	end, { description = "close", group = "client" }),
	awful.key(
		{ modkey, "Control" },
		"space",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "move to master", group = "client" }),
	awful.key({ modkey }, "t", function(c)
		c.ontop = not c.ontop
	end, { description = "toggle keep on top", group = "client" }),
	awful.key({ modkey }, "n", function(c)
		-- The client currently has the input focus, so it cannot be
		-- minimized, since minimized clients can't have the focus.
		c.minimized = true
	end, { description = "minimize", group = "client" }),
	awful.key({ modkey }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = "(un)maximize", group = "client" }),
	awful.key({ modkey, "Control" }, "m", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = "(un)maximize vertically", group = "client" }),
	awful.key({ modkey, "Shift" }, "m", function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, { description = "(un)maximize horizontally", group = "client" })
)

local _tag = { "a", "s", "d", "f", "i", "o", "p" }
for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, _tag[i], function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag " .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, _tag[i], function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag " .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, _tag[i], function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag " .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, _tag[i], function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag " .. i, group = "tag" })
	)
end

clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)
