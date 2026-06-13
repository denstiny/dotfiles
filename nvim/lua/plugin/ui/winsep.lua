local colorful_winsep = require("colorful-winsep")

colorful_winsep.setup({
	hi = {
		fg = "#9A95C1",
	},
	events = { "WinEnter", "WinResized" },
	symbols = { "─", "│", "┌", "┐", "└", "┘" },
	exponential_smoothing = true,
	anchor = {
		left = { height = 1, x = -1, y = -1 },
		right = { height = 1, x = -1, y = 0 },
		up = { width = 0, x = -1, y = 0 },
		bottom = { width = 0, x = 1, y = 0 },
	},
})
