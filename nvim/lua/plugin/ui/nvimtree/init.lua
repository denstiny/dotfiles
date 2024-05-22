local nvim_tree = require("nvim-tree")
nvim_tree.setup({
	sort_by = "case_sensitive",
	root_dirs = { "build", ".git" },
	view = {
		adaptive_size = false,
		--preserve_window_proportions = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
		--side = "right"
		side = "right",
		hide_root_folder = false,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
		change_dir = {
			global = true,
		},
	},
	update_focused_file = {
		enable = true,
		update_root = true,
		ignore_list = {},
	},
	renderer = {
		group_empty = true,
		root_folder_label = function(path)
			return "       Root: " .. vim.fn.fnamemodify(path, ":t") .. "/"
		end,
		indent_markers = {
			enable = true,
		},
		icons = {
			show = {
				git = true,
			},
		},
	},
	filters = {},
	diagnostics = {
		enable = false,
	},
	notify = {
		threshold = vim.log.levels.OFF,
	},
})
