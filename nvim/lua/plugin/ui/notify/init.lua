vim.opt.termguicolors = true

vim.notify = require("notify")
local stages = require("notify.stages.slide")("top_down")
vim.notify.setup({
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
	stages = "slide",
	time_formats = {
		notification = "%T",
		notification_history = "%FT%T",
	},
	timeout = 1500,
	top_down = false,
})
