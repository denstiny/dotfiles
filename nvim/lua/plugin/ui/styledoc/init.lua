require("luarocks-nvim").setup({ rocks = { "magick" } })
require("image").setup({
	backend = "kitty",
	integrations = {
		markdown = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = false,
			filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
		},
		neorg = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = false,
			filetypes = { "norg" },
		},
		html = {
			enabled = false,
		},
		css = {
			enabled = false,
		},
	},
	max_width = nil,
	max_height = nil,
	max_width_window_percentage = nil,
	max_height_window_percentage = 50,
	window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
	window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
	editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
	tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
	hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
})
require("styledoc").setup({
	ui = {
		block = {
			enable = false,
			symbol = "█",
		},
		list = {
			enable = false,
			symbol = {
				list_minus = "",
				task_undo = " 󰄱 ",
				task_do = "  ",
			},
		},
		title = {
			enable = true,
			symbol = {
				h1 = "○",
				h2 = " ○ ",
				h3 = "  ○ ",
				h4 = "   ○ ",
				h5 = "    ○ ",
				h6 = "     ○ ",
				h7 = "      ○ ",
			},
		},
		table = {
			enable = false,
			symbol = {
				leftalign = "󰘟",
				rightalign = "󰘠",
				line = "│",
			},
		},
		breakline = {
			enable = true,
			symbol = function(bufnr)
				local winid = vim.fn.bufwinid(bufnr)
				local width = vim.fn.winwidth(winid)
				local str = string.rep("-", width)
				return str
			end,
		},
		codeblock = {
			enable = false,
			symbol = {
				start = function(bufnr, lang)
					local winid = vim.fn.bufwinid(bufnr)
					local width = vim.fn.winwidth(winid)
					local spe = string.rep("─", width / 2 - string.len(lang) / 2 - 6)
					local str = "╭" .. spe .. string.format(" %s ", lang) .. spe .. "╮"
					return str
				end,
				end_ = function(bufnr)
					local winid = vim.fn.bufwinid(bufnr)
					local width = vim.fn.winwidth(winid)
					local spe = string.rep("─", math.ceil(width / 2) - 5)
					local str = "╰" .. spe .. spe .. "╯"
					return str
				end,
			},
		},
	},
})

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*.md",
	callback = function(arg)
		--require("styledoc").format_table(arg.buf)
	end,
})
