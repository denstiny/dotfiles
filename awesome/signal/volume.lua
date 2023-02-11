-- volume signal
-- credits to Javacafe01

local awful = require("awful")
local naughty = require("naughty")

volume_old = 0
muted_old = 0
local function emit_volume_info()
	awful.spawn.easy_async_with_shell("pamixer --get-volume-human", function(stdout)
		local volume = stdout:match("(%d+)")
		local muted_int = 0
		local volume_int = tonumber(volume)
		if stdout == "muted" then
			volume = volume_old
			muted_int = 1
		end
		if volume_int ~= volume_old or muted_int ~= muted_old then
			awesome.emit_signal("signal::volume", volume_int, muted)
			volume_old = volume_int
			muted_old = muted_int
		end
	end)
end

-- Run once to initialize widgets
emit_volume_info()

-- Sleeps until pactl detects an event (volume up/down/toggle mute)
local volume_script = [[
    bash -c "
    LANG=C pactl subscribe 2> /dev/null | grep --line-buffered \"Event 'change' on sink #\"
    "]]

-- Kill old pactl subscribe processes
awful.spawn.easy_async({ "pkill", "--full", "--uid", os.getenv("USER"), "^pactl subscribe" }, function()
	-- Run emit_volume_info() with each line printed
	awful.spawn.with_line_callback(volume_script, {
		stdout = function(line)
			emit_volume_info()
		end,
	})
end)
