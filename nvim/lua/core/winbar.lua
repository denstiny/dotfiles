local M = {}

vim.cmd([[
  highlight WinBar           guifg=#BBBBBB gui=bold
  highlight WinBarNC         guifg=#888888 gui=bold
  ]])

M.getFileName = function()
	local name = vim.fn.expand("%:t")
	return name
end

function M.spacebar(winid)
	local name = vim.fn.expand("%:t")
	return string.rep(" ", math.ceil(vim.fn.winwidth(winid) / 2) - math.ceil(string.len(name) / 2) - 3)
end

_G.status = M
local noexex = {
	"notify",
	"noice",
	"lazy",
	"NvimTree",
	"dapui_scopes",
	"dapui_watches",
	"dapui_stacks",
	"dapui_breakpoints",
	"dapui_scopes",
}
vim.api.nvim_create_autocmd({ "WinResized", "VimResized", "BufWinEnter" }, {
	callback = function(_)
		local windows = vim.api.nvim_list_wins()
		for _, win in pairs(windows) do
			if vim.api.nvim_win_get_config(win)["relative"] == "" then
				local buftype = vim.api.nvim_get_option_value("filetype", { buf = vim.api.nvim_win_get_buf(win) })
				--if buftype == "notify" or buftype == "noice" then
				--	return
				--end
				if not require("core.utils").is_key_in_table(noexex, buftype) then
					local space = M.spacebar(win)
					local filename = M.getFileName()
					if filename ~= "" then
						vim.api.nvim_set_option_value(
							"winbar",
							space .. "( " .. "%{%v:lua.status.getFileName()%}" .. " )" .. space,
							{
								win = win,
							}
						)
					end
				end
			end
		end
	end,
})
return M
