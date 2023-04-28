require("horizon").setup({
	plugins = {
		cmp = true,
		indent_blankline = true,
		cmp = true,
		indent_blankline = true,
		nvim_tree = true,
		telescope = true,
		which_key = true,
		barbar = true,
		cmp = true,
		notify = true,
		symbols_outline = true,
		telescope = true,
		nvim_tree = true,
		neo_tree = true,
		gitsigns = true,
		crates = true,
		hop = true,
		navic = true,
		quickscope = true,
	},
})
vim.cmd("colorscheme horizon")
require("core.chronus-theme")()
