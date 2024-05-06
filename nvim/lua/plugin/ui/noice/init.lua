require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		progress = {
			enabled = false,
			format = "lsp_progress",
			format_done = "lsp_progress_done",
			throttle = 1000 / 30, -- frequency to update lsp progress message
			view = "mini",
		},
		hover = { enabled = false },
		signature = { enabled = false },
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
	message = {
		-- Messages shown by lsp servers
		enabled = true,
		view = "notify",
		opts = {},
	},
})
