local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local naughty = require("naughty")

local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")
local cpu = require("signal.pcpu")
local theme = require("theme.theme")

-- battery widget
local battery_progress = wibox.widget({
	color = "#434C5E",
	background_color = "#00000000",
	forced_width = dpi(28),
	border_width = dpi(1),
	border_color = "#615D76",
	paddings = dpi(3),
	value = 70,
	max_value = 100,
	margins = dpi(3),
	widget = wibox.widget.progressbar,
})

local separated = function(var, width)
	return {
		font = "SHYF-2020 14",
		text = " " .. var,
		forced_height = 18,
		forced_width = width,
		widget = wibox.widget.textbox,
	}
end

-- show battery widget
awful.popup({
	widget = {
		{
			separated("电量", 60),
			{
				value = 2,
				forced_height = 13,
				forced_width = 100,
				shape = gears.shape.rounded_bar,
				widget = battery_progress,
			},
			margins = 1,
			spacing = 1,
			layout = wibox.layout.fixed.horizontal,
		},
		margins = 0,
		widget = wibox.container.margin,
	},
	border_color = "#1A1B26",
	border_width = 5,
	placement = function(c)
		awful.placement.bottom_right(c, { margins = dpi(7) })
	end,
	shape = gears.shape.rounded_rect,
	visible = true,
})

-- update battery widget data
awesome.connect_signal("signal::battery", function(value)
	battery_progress.value = value
	if value < 70 and value > 50 then
		battery_progress.border_color = "#BDE51A"
	elseif value < 50 and value > 30 then
		battery_progress.border_color = "#CF884A"
	elseif value < 30 and value > 10 then
		battery_progress.border_color = "#9B4642"
	elseif value < 10 then
		battery_progress.border_color = "#E51A1A"
	elseif value > 70 then
		battery_progress.border_color = "#638388"
	end
end)

awesome.connect_signal("signal::charger", function(charger)
	if charger then
		battery_progress.border_color = "#908CAA"
	else
		battery_progress.border_color = "#615D76"
	end
end)

-- show cpu widget
awful.popup({
	widget = {
		{
			{
				image = gfs.get_configuration_dir() .. "theme/layouts/aero.jpg",
				resize = false,
				widget = wibox.widget.imagebox,
			},
			cpu({
				width = 155,
				step_width = 2,
				step_spacing = 0,
				color = "#434c5e",
			}),

			margins = 1,
			spacing = 1,
			layout = wibox.layout.fixed.horizontal,
		},
		forced_height = 45,
		margins = 1,
		widget = wibox.container.margin,
	},
	--border_color = '#1A1B26',
	border_width = 0,
	placement = function(c)
		awful.placement.top_left(c, { margins = { left = dpi(20), top = dpi(20) } })
	end,
	shape = gears.shape.rounded_rect,
	visible = true,
})

-- screen brightness widget
local brightness_progress = wibox.widget({
	color = "#434C5E",
	background_color = "#00000000",
	forced_width = dpi(28),
	border_width = dpi(1),
	border_color = "#615D76",
	paddings = dpi(3),
	value = 70,
	margins = dpi(3),
	max_value = 100,
	widget = wibox.widget.progressbar,
})

-- show screen brightness widget
awful.popup({
	widget = {
		{
			separated("亮度", 50),
			{
				value = 2,
				forced_height = 13,
				forced_width = 100,
				shape = gears.shape.rounded_bar,
				widget = brightness_progress,
			},
			margins = 1,
			spacing = 1,
			layout = wibox.layout.fixed.horizontal,
		},
		margins = 0,
		widget = wibox.container.margin,
	},
	border_color = "#1A1B26",
	border_width = 5,
	placement = function(c)
		awful.placement.bottom_right(c, { margins = { right = dpi(250), bottom = dpi(7) } })
	end,
	shape = gears.shape.rounded_rect,
	visible = true,
})

-- update screen brightness widget
awesome.connect_signal("signal::brightness", function(value)
	brightness_progress.value = value
end)

--  Sound the widget
local voice_progress = wibox.widget({
	color = "#434C5E",
	background_color = "#00000000",
	forced_width = dpi(28),
	border_width = dpi(1),
	border_color = "#615D76",
	paddings = dpi(3),
	value = 70,
	max_value = 100,
	margins = dpi(3),
	widget = wibox.widget.progressbar,
})

-- show sound the widget
awful.popup({
	widget = {
		{
			separated("音量", 50),
			{
				value = 70,
				forced_height = 10,
				forced_width = 100,
				shape = gears.shape.rounded_bar,
				widget = voice_progress,
			},
			margins = 1,
			spacing = 1,
			layout = wibox.layout.fixed.horizontal,
		},
		margins = 0,
		widget = wibox.container.margin,
	},
	border_color = "#1A1B26",
	border_width = 5,
	placement = function(c)
		awful.placement.bottom_right(c, { margins = { right = dpi(500), bottom = dpi(7) } })
	end,
	shape = gears.shape.rounded_rect,
	visible = true,
})

-- update sound the widget
awesome.connect_signal("signal::volume", function(volume_int, muted)
	voice_progress.value = volume_int
	if muted then
		voice_progress.color = "#b3b3b5"
	else
		voice_progress.color = "#434C5E"
	end
end)
