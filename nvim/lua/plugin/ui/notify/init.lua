vim.opt.termguicolors = true

--local stages = require("notify.stages.slide")("top_down")
require("notify").setup({
	background_colour = "NotifyBackground",
	fps = 60,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = "",
	},
	level = 2,
	minimum_width = 50,
	render = "minimal",
	--stages = "slide",
	stages = "static",
	time_formats = {
		notification = "%T",
		notification_history = "%FT%T",
	},
	timeout = 1500,
	top_down = false,
})

vim.notify = notify
