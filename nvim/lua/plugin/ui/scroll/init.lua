-- local scrollbar = require("scrollbar")
-- scrollbar.setup({
-- 	show = true,
-- 	handle = {
-- 		color = "#2e303e",
-- 	},
-- 	marks = {},
-- 	handlers = {
-- 		cursor = false,
-- 	},
-- 	excluded_filetypes = {
-- 		"prompt",
-- 		"TelescopePrompt",
-- 		"noice",
-- 		"NvimTree",
-- 		"alpha",
-- 	},
-- })
--
-- local group = vim.api.nvim_create_augroup("_scrollbar", { clear = true })

require("scrollview").setup({
	excluded_filetypes = { "nerdtree" },
	current_only = true,
	base = "right",
	--column = 132,
	signs_on_startup = { "all" },
	diagnostics_severities = { vim.diagnostic.severity.ERROR },
})
