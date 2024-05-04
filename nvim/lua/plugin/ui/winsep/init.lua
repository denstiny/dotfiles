local colorful_winsep = require("colorful-winsep")
colorful_winsep.setup({
	hi = {
		fg = "#E6C384",
	},
	symbols = { "─", "│", "┌", "┐", "└", "┘" },
	--smooth = false,
	exponential_smoothing = true,
	anchor = {
		left = { height = 1, x = -1, y = -1 },
		right = { height = 1, x = -1, y = 0 },
		up = { width = 0, x = -1, y = 0 },
		bottom = { width = 0, x = 1, y = 0 },
	},
})
