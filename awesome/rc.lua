-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- 标准的超赞图书馆
local gears = require("gears")
local awful = require("awful")

require("awful.autofocus")
require("collision")()
-- 小部件和布局库
local wibox = require("wibox")
-- 主题处理库
local beautiful = require("beautiful")
-- 通知库
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- 为vim和其他应用程序启用热键帮助小部件
-- 当打开具有匹配名称的客户端时：
-- theme key
polybar_theme = "forest"
--
require("awful.hotkeys_popup.keys")

if awesome.startup_errors then
	naughty.notify({ preset = naughty.config.presets.critical,
	title = "Oops, there were errors during startup!",
	text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function (err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true

		naughty.notify({ preset = naughty.config.presets.critical,
		title = "Oops, an error happened!",
		text = tostring(err) })
		in_error = false
	end)
end
-- }}}

-- 主题定义颜色，图标，字体和壁纸。
beautiful.init("~/.config/awesome/src/fhuizing/theme.lua") -- 主题
-- terminal = "xterm"
terminal = "st"
editor = os.getenv("EDITOR") or "nvim" -- 设置默认编辑器
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
	--awful.layout.suit.magnifier,
	--awful.layout.suit.floating,
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
	-- awful.layout.suit.tile.bottom,
	--awful.layout.suit.tile.top,
	--awful.layout.suit.fair,
	--awful.layout.suit.fair.horizontal,
	awful.layout.suit.spiral,
	--				lain.layout.termfair,
	--				lain.layout.termfair.center,
	--awful.layout.suit.spiral.dwindle,
	-- awful.layout.suit.max,
	--awful.layout.suit.max.fullscreen,
	awful.layout.suit.corner.nw,
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
}

-- }}}

-- Create a launcher widget and a main menu
myawesomemenu = {
	{ "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{ "quit", function() awesome.quit() end },
	{"poweroff",terminal .. " -e  poweroff"}
}

-- 自定义菜单栏
mytool = {
	{"禁用脚本",function()
		io.popen("rm ~/.shell.lok*")
	end },
	{"关闭",function()
		io.popen("bash ~/.config/awesome/src/init.sh &")
		io.popen("bash ~/.config/awesome/src/Touch.sh &")
	end},
	{"打开",function()
		io.popen("bash ~/.config/awesome/src/endkey.sh &")
		io.popen("bash ~/.config/awesome/src/OTouch.sh &")
	end},
	{"打开默认键盘",function ()
		io.popen("bash ~/.config/awesome/src/endkey.sh &")
		-- 打开笔记本默认键盘
	end},
	{"关闭默认键盘",function ()
		io.popen("bash ~/.config/awesome/src/init.sh &")
		-- 关闭笔记本默认键盘
	end},
	{"关闭触摸板",function()
		io.popen("bash ~/.config/awesome/src/Touch.sh &")
		--- 关闭默认的触摸板
	end},
	{"打开触摸板",function()
		io.popen("bash ~/.config/awesome/src/OTouch.sh &")
		--- 关闭默认的触摸板
	end}
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
{ "open terminal", terminal },
{"setting",terminal .. "-e 'gnome-control-center'"},
{"tool",mytool}
		}
	})


	mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
	menu = mymainmenu })

	-- Menubar configuration
	menubar.utils.terminal = terminal -- Set the terminal for applications that require it
	-- }}}

	-- Keyboard map indicator and switcher
	mykeyboardlayout = awful.widget.keyboardlayout()

	-- Create a textclock widget
	mytextclock = wibox.widget.textclock()

	-- Create a wibox for each screen and add it
	local taglist_buttons = gears.table.join(
	awful.button({ }, 1, function(t) t:view_only() end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({ }, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
	awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
	)

	local tasklist_buttons = gears.table.join(
	awful.button({ }, 1, function (c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal(
			"request::activate",
			"tasklist",
			{raise = true}
			)
		end
	end),
	awful.button({ }, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({ }, 4, function ()
		awful.client.focus.byidx(1)
	end),
	awful.button({ }, 5, function ()
		awful.client.focus.byidx(-1)
	end))

	local function set_wallpaper(s)
		-- Wallpaper
		if beautiful.wallpaper then
			local wallpaper = beautiful.wallpaper
			-- If wallpaper is a function, call it with the screen
			if type(wallpaper) == "function" then
				wallpaper = wallpaper(s)
			end
			gears.wallpaper.maximized(wallpaper, s, true)
		end
	end

	-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
	screen.connect_signal("property::geometry", set_wallpaper)

	awful.screen.connect_for_each_screen(function(s)
		-- Wallpaper
		set_wallpaper(s)

		-- Each screen has its own tag table.
		--awful.tag({ "A", "W", "E", "S", "O", "M", "E", "W", "M" }, s, awful.layout.layouts[1])
		local names = { "1:Web", "2:Code","3:Notes", "4:Music" ,"5:Comm" ,"6:Play","7:Social","8","9"}
		local l = awful.layout.suit  -- Just to save some typing: use an alias.
		local layouts = { l.tile, l.tile, l.tile, l.tile, l.tile,
		--local layouts = l.max,
		l.tile, l.tile.left, l.tile, l.tile }
		awful.tag(names, s, layouts)
		-- Create a promptbox for each screen
		s.mypromptbox = awful.widget.prompt()
		-- Create an imagebox widget which will contain an icon indicating which layout we're using.
		-- We need one layoutbox per screen.
		s.mylayoutbox = awful.widget.layoutbox(s)
		s.mylayoutbox:buttons(gears.table.join(
		awful.button({ }, 1, function () awful.layout.inc( 1) end),
		awful.button({ }, 3, function () awful.layout.inc(-1) end),
		awful.button({ }, 4, function () awful.layout.inc( 1) end),
		awful.button({ }, 5, function () awful.layout.inc(-1) end)))
		-- Create a taglist widget
		s.mytaglist = awful.widget.taglist {
			screen  = s,
			filter  = awful.widget.taglist.filter.all,
			buttons = taglist_buttons
		}

		-- 创建任务列表小部件
		s.mytasklist = awful.widget.tasklist {
			screen  = s,
			filter  = awful.widget.tasklist.filter.currenttags,
			buttons = tasklist_buttons
		}

		-- 创建wibox
		--					s.mywibox = awful.wibar({ position = "bottom", screen = s})

		-- 创建一个cpu监控小部件
		--					local cpu = lain.widget.cpu {
			--						settings = function()
				--							widget:set_markup("  " .. cpu_now.usage)
				--						end
				--
				--					}

				--  创建电池小部件
				--					local mybattery = lain.widget.bat {
					--						timeout = 5,
					--						settings = function()
						--							widget:set_markup(" 🔌 " .. bat_now.perc)
						--							batstat = bat_now
						--						end
						--					}

						--					local mybattery_t = awful.tooltip {
							--						objects = { mybattery.widget },
							--						timer_function = function()
								--							local msg = ""
								--							for i = 1, #batstat.n_status do
								--								msg = msg .. lain.util.markup.font("monospace 10",
								--									string.format("┌[Battery %d]\n├Status:\t%s\n└Percentage:\t%s\n\n",
								--									i-1, batstat.n_status[i], batstat.n_perc[i]))
								--							end
								--							return msg .. lain.util.markup.font("monospace 10", "Time left:\t" .. batstat.time)
								--						end
								--					}

								-- 将小部件添加到wibox
								--					s.mywibox:setup {
									--						layout = wibox.layout.align.horizontal,
									--						{ -- Left widgets
									--							layout = wibox.layout.fixed.horizontal,
									--							mylauncher,
									--							s.mytaglist,
									--							s.mypromptbox,
									--						},
									--						s.mytasklist, -- Middle widget
									--						{ -- Right widgets
									--							layout = wibox.layout.fixed.horizontal,
									--							mykeyboardlayout,
									--							wibox.widget.systray(),
									--							cpu,
									--							mybattery,
									--							mytextclock,
									--							s.mylayoutbox,
									--						},
									--					}
								end)
								-- }}}

								root.buttons(gears.table.join(
								awful.button({ }, 3, function () mymainmenu:toggle() end),
								awful.button({ }, 4, awful.tag.viewnext),
								awful.button({ }, 5, awful.tag.viewprev)
								))
								-- }}}

								globalkeys = gears.table.join(
								awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
								{description="show help", group="awesome"}),
								awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
								{description = "view previous", group = "tag"}),
								awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
								{description = "view next", group = "tag"}),
								awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
								{description = "go back", group = "tag"}),

								awful.key({ modkey,           }, "j",
								function ()
									awful.client.focus.byidx( 1)
								end,
								{description = "focus next by index", group = "client"}
								),
								awful.key({ modkey,           }, "k",
								function ()
									awful.client.focus.byidx(-1)
								end,
								{description = "focus previous by index", group = "client"}
								),
								awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
								{description = "show main menu", group = "awesome"}),

								-- 自定义快捷键
								awful.key({ "Control" }, "1",
								function ()
									-- 关闭
									io.popen("bash ~/.config/awesome/src/init.sh &")
									io.popen("bash ~/.config/awesome/src/Touch.sh &")
								end),
								awful.key({"Control"},"2",
								-- 打开
								function()
									io.popen("bash ~/.config/awesome/src/endkey.sh &")
									io.popen("bash ~/.config/awesome/src/OTouch.sh &")
								end),
								-- 降低屏幕亮度
								awful.key({"Control"},"3",
								function()
									awful.util.spawn("light -A 5")
								end),
								awful.key({"Control"},"4",
								function()
									awful.util.spawn("light -U 5")
								end),
								--- 截屏
								awful.key({modkey},"p",
								function()
									awful.util.spawn("flameshot gui")
								end),
								--- 切换壁纸
								awful.key({"Control"},"5",
								function()
									io.popen("feh --randomize --bg-fill ~/Imager/")
								end),
								-- 锁屏
								awful.key({modkey},"l",
								function()
									io.popen("/usr/lib/xscreensaver/gluqlo -root")
								end),

								-- Layout manipulation
								awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
								{description = "swap with next client by index", group = "client"}),
								awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
								{description = "swap with previous client by index", group = "client"}),
								awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative( 1) end,
								{description = "focus the next screen", group = "screen"}),
								awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative(-1) end,
								{description = "focus the previous screen", group = "screen"}),
								awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
								{description = "jump to urgent client", group = "client"}),
								awful.key({ modkey,           }, "Tab",
								function ()
									awful.client.focus.history.previous()
									if client.focus then
										client.focus:raise()
									end
								end,
								{description = "go back", group = "client"}),

								-- Standard program
								awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
								{description = "open a terminal", group = "launcher"}),
								awful.key({ modkey, "Shift" }, "r", awesome.restart,
								{description = "reload awesome", group = "awesome"}),
								awful.key({ modkey, "Shift"   }, "e", awesome.quit, -- awesome quit
								{description = "quit awesome", group = "awesome"}),

								awful.key({ modkey,           }, "d",     function () awful.tag.incmwfact( 0.05)          end,
								{description = "increase master width factor", group = "layout"}),
								awful.key({ modkey,           }, "a",     function () awful.tag.incmwfact(-0.05)          end,
								{description = "decrease master width factor", group = "layout"}),
								awful.key({ modkey, "Shift"   }, "a",     function () awful.tag.incnmaster( 1, nil, true) end,
								{description = "increase the number of master clients", group = "layout"}),
								awful.key({ modkey, "Shift"   }, "d",     function () awful.tag.incnmaster(-1, nil, true) end,
								{description = "decrease the number of master clients", group = "layout"}),
								awful.key({ modkey, "Control" }, "a",     function () awful.tag.incncol( 1, nil, true)    end,
								{description = "increase the number of columns", group = "layout"}),
								awful.key({ modkey, "Control" }, "d",     function () awful.tag.incncol(-1, nil, true)    end,
								{description = "decrease the number of columns", group = "layout"}),
								--awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
								--{description = "select next", group = "layout"}),
								awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
								{description = "select previous", group = "layout"}),

								awful.key({ modkey, "Control" }, "n",
								function ()
									local c = awful.client.restore()
									-- Focus restored client
									if c then
										c:emit_signal(
										"request::activate", "key.unminimize", {raise = true}
										)
									end
								end,
								{description = "restore minimized", group = "client"}),

								-- Prompt
								awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
								{description = "run prompt", group = "launcher"}),

								awful.key({ modkey }, "x",
								function ()
									awful.prompt.run {
										prompt       = "Run Lua code: ",
										textbox      = awful.screen.focused().mypromptbox.widget,
										exe_callback = awful.util.eval,
										history_path = awful.util.get_cache_dir() .. "/history_eval"
									}
								end,
								{description = "lua execute prompt", group = "awesome"}),
								-- Menubar
								awful.key({ modkey }, "o",
								function()
									--menubar.show()
									io.popen("rofi -no-config -no-lazy-grab -show drun -modi drun -theme ~/.config/polybar/"..polybar_theme.."/scripts/rofi/launcher.rasi")
								end,
								{description = "show the menubar", group = "launcher"})
								)

								clientkeys = gears.table.join(
								awful.key({ modkey,           }, "f",
								function (c)
									c.fullscreen = not c.fullscreen
									c:raise()
								end,
								{description = "toggle fullscreen", group = "client"}),
								awful.key({ modkey, "Shift"   }, "q",      function (c) c:kill()                         end,
								{description = "close", group = "client"}),
								awful.key({ modkey,  }, "space",  awful.client.floating.toggle                     ,
								{description = "toggle floating", group = "client"}),
								awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
								{description = "move to master", group = "client"}),
								awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
								{description = "move to screen", group = "client"}),
								awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
								{description = "toggle keep on top", group = "client"}),
								awful.key({ modkey,           }, "n",
								function (c)
									-- The client currently has the input focus, so it cannot be
									-- minimized, since minimized clients can't have the focus.
									c.minimized = true
								end ,
								{description = "minimize", group = "client"}),
								awful.key({ modkey,           }, "m",
								function (c)
									c.maximized = not c.maximized
									c:raise()
								end ,
								{description = "(un)maximize", group = "client"}),
								awful.key({ modkey, "Control" }, "m",
								function (c)
									c.maximized_vertical = not c.maximized_vertical
									c:raise()
								end ,
								{description = "(un)maximize vertically", group = "client"}),
								awful.key({ modkey, "Shift"   }, "m",
								function (c)
									c.maximized_horizontal = not c.maximized_horizontal
									c:raise()
								end ,
								{description = "(un)maximize horizontally", group = "client"})
								)

								-- Bind all key numbers to tags.
								-- Be careful: we use keycodes to make it work on any keyboard layout.
								-- This should map on the top row of your keyboard, usually 1 to 9.
								for i = 0, 9 do
									globalkeys = gears.table.join(globalkeys,
									-- View tag only.
									awful.key({ modkey }, "#" .. i + 9,
									function ()
										local screen = awful.screen.focused()
										local tag = screen.tags[i]
										if tag then
											tag:view_only()
										end
									end,
									{description = "view tag #"..i, group = "tag"}),
									-- Toggle tag display.
									awful.key({ modkey, "Control" }, "#" .. i + 9,
									function ()
										local screen = awful.screen.focused()
										local tag = screen.tags[i]
										if tag then
											awful.tag.viewtoggle(tag)
										end
									end,
									{description = "toggle tag #" .. i, group = "tag"}),
									-- Move client to tag.
									awful.key({ modkey, "Shift" }, "#" .. i + 9,
									function ()
										if client.focus then
											local tag = client.focus.screen.tags[i]
											if tag then
												client.focus:move_to_tag(tag)
											end
										end
									end,
									{description = "move focused client to tag #"..i, group = "tag"}),
									-- Toggle tag on focused client.
									awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
									function ()
										if client.focus then
											local tag = client.focus.screen.tags[i]
											if tag then
												client.focus:toggle_tag(tag)
											end
										end
									end,
									{description = "toggle focused client on tag #" .. i, group = "tag"})
									)
								end

								clientbuttons = gears.table.join(
								awful.button({ }, 1, function (c)
									c:emit_signal("request::activate", "mouse_click", {raise = true});
									client.focus = c; c:raise() -- 设置鼠标左键从新获得焦点
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

								-- Set keys
								root.keys(globalkeys)
								-- }}}

								-- Rules to apply to new clients (through the "manage" signal).
								awful.rules.rules = {
									-- All clients will match this rule.
									{ rule = { },
									properties = { border_width = beautiful.border_width,
									border_color = beautiful.border_normal,
									focus = awful.client.focus.filter,
									raise = true,
									size_hints_honor = false,
									keys = clientkeys,
									buttons = clientbuttons,
									screen = awful.screen.preferred,
									placement = awful.placement.no_overlap+awful.placement.no_offscreen
								}
							},

							-- Floating clients. 设置窗口浮动
							{ rule_any = {
								instance = {
									"DTA",  -- Firefox addon DownThemAll.
									"copyq",  -- Includes session name in class.
									"krunner",
									"pinentry",
								},
								class = { --窗口class ,可以使用xrop获取
								"Wine",
								"SimpleScreenRecorder",
								"CMakeSetup",
								"Cheese",
								"Pavucontrol",
								"Mtodo",
								"feh",
								"mpv",
								"MPlayer",
								"Xfce4-appfinder",
								"Steam",
								"test",
								"Arandr",
								"Blueman-manager",
								"Gpick",
								"Kruler",
								"MessageWin",  -- kalarm.
								"Sxiv",
								"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
								"Wpa_gui",
								"veromix",
								--"Google-chrome",
								"xtightvncviewer"},

								-- 请注意，在创建客户端后，可能会稍微设置xprop中显示的name属性
								-- 并且此处显示的名称可能与此处定义的规则不匹配.
								name = {
									"Event Tester",  -- xev.
								},
								role = {
									"AlarmWindow",  -- Thunderbird's calendar.
									"ConfigManager",  -- Thunderbird's about:config.
									"pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
								}
							}, properties = { floating = true }},

							-- Add titlebars to normal clients and dialogs
							{ rule_any = {type = { "normal", "dialog" }
						}, properties = { titlebars_enabled = false } --禁用标题栏
					},

					-- Set Firefox to always map on the tag named "2" on screen 1.
					-- { "1:Web", "2:Code","3:Notes", "4:Music" ,"5:Comm" ,"6:Play","7:Social"} 
					{ rule = { instance = "lx-music-desktop"},
					properties = { screen = 1, tags = { "1:Web", "2:Code","3:Notes", "4:Music" ,"5:Comm" ,"6:Play","7:Social"},
					focusable = false, below = true, maximized_vertical = false, maximized_horizontal = false
				} 
				},
					-- focusable 聚焦
				}
				-- }}}

				-- Signal function to execute when a new client appears.
				client.connect_signal("manage", function (c)
					-- 将窗口设置在从属设备上，
					-- 即将其放置在其他对象的末尾，而不是将其设置为主。
					-- 如果不很棒，则启动awful.client.setslave（c）结束

					if awesome.startup
						and not c.size_hints.user_position
						and not c.size_hints.program_position then
						-- 更改屏幕计数后，防止客户端无法访问。
						awful.placement.no_offscreen(c)
					end
				end)

				-- Add a titlebar if titlebars_enabled is set to true in the rules.
				client.connect_signal("request::titlebars", function(c)
					-- 标题栏按钮
					local buttons = gears.table.join(
					awful.button({ }, 1, function()
						c:emit_signal("request::activate", "titlebar", {raise = true})
						awful.mouse.client.move(c)
					end),
					awful.button({ }, 3, function()
						c:emit_signal("request::activate", "titlebar", {raise = true})
						awful.mouse.client.resize(c)
					end)
					)

					awful.titlebar(c) : setup {
						{ -- Left
						awful.titlebar.widget.iconwidget(c),
						buttons = buttons,
						layout  = wibox.layout.fixed.horizontal
					},
					{ -- Middle
					{ -- Title
					align  = "center",
					widget = awful.titlebar.widget.titlewidget(c)
				},
				buttons = buttons,
				layout  = wibox.layout.flex.horizontal
			},
			{ -- Right
			awful.titlebar.widget.floatingbutton (c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.stickybutton   (c),
			awful.titlebar.widget.ontopbutton    (c),
			awful.titlebar.widget.closebutton    (c),
			layout = wibox.layout.fixed.horizontal()
		},
		layout = wibox.layout.align.horizontal
	}
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
-- run_once("fcitx")
--  自动启动
os.execute"dex -a -e fcitx"

-- 开启自动启动
autorun = true
autorunApps =
{
	"picom --config ~/.config/awesome/src/picom.conf &",
	"pkill kwallet",
	"xhost +",
	"fcitx5",
	"/usr/lib/gsd-xsettings &",
	"flameshot",
}


-- 窗口圆角

client.connect_signal("manage", function (c)

	c.shape = function(cr,w,h)

		gears.shape.rounded_rect(cr,w,h,10)
	end

end)



-- 窗口规则
---- 内边框
beautiful.useless_gap = 1
---- 外边框
for s = 1, screen.count()
	do
		awful.screen.padding(screen[s], { top = 0, left = 0, right = 0, bottom = 0 })
	end

	--
	if autorun then
		for app = 1, #autorunApps do
			awful.util.spawn_with_shell(autorunApps[app])
		end
	end

	io.popen("bash ~/.config/awesome/src/feh.sh &")
	io.popen("notify-send -t 60000 -i ~/.config/awesome/src/res.jpg \"Welcome to use\" ")
	io.popen("bash ~/.config/polybar/launch.sh --"..polybar_theme)
