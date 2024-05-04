-- @author      : denstiny (2254228017@qq.com)
-- @file        : hl
-- @created     : Saturday May 04, 2024 22:14:30 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

local M = {}

function M.to_hex(color_value)
	if color_value then
		return string.format("#%06x", color_value)
	end
end

function M.get_highlight_group_colors(name)
	local hl = vim.api.nvim_get_hl_by_name(name, true)

	-- 提取前景色和背景色
	local fg = M.to_hex(hl.foreground)
	local bg = M.to_hex(hl.background)

	return fg, bg
end
return M
