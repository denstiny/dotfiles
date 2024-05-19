local toggleterm = require("toggleterm")

function get_highlight_group_bg_color(group_name)
	local group_info = vim.api.nvim_get_hl_by_name(group_name, true)
	if group_info.background then
		local bg_color = string.format("#%06x", group_info.background)
		return bg_color
	else
		return nil
	end
end
local group_bg_color = get_highlight_group_bg_color("Normal")
function hi_bg(group, hex_color)
	if group then
		vim.cmd(string.format("hi %s guibg=%s", group, hex_color))
	end
end

local hex_bg = get_highlight_group_bg_color("Normal")
hex_bg = "#E6E4DF"

toggleterm.setup({
	open_mapping = nil,
	size = 7,
	shade_filetypes = {},
	shade_terminals = true,
	--shading_factor = '1',
	start_in_insert = true,
	persist_size = true,
	direction = "horizontal",
	highlights = {
		Normal = {
			guibg = "#1A1B26",
		},
		NormalFloat = {
			link = "Normal",
		},
	},
	on_open = function()
		hi_bg("ToggleTerm1StatusLineNC", hex_bg)
		hi_bg("ToggleTerm1EndOfBuffer", hex_bg)
		hi_bg("ToggleTerm1StatusLine", hex_bg)
		hi_bg("ToggleTerm1SignColumn", hex_bg)
		hi_bg("ToggleTerm1WinBarNC", hex_bg)
		hi_bg("ToggleTerm1WinBar", hex_bg)
		hi_bg("ToggleTerm1Normal", hex_bg)
		hi_bg("StatusLine", hex_bg)
	end,
	on_close = function()
		hi_bg("StatusLine", get_highlight_group_bg_color("Normal"))
	end,
})
