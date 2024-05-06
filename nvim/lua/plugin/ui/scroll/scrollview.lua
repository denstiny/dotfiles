require("scrollview").setup({
	excluded_filetypes = { "nerdtree" },
	current_only = true,
	base = "right",
	--column = 132,
	signs_on_startup = { "all" },
	diagnostics_severities = { vim.diagnostic.severity.ERROR },
})
