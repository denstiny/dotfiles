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
vim.api.nvim_create_autocmd({ "WinResized", "VimResized", "BufWinEnter" }, {
	callback = function(arg)
		local windows = vim.api.nvim_list_wins()
		for _, win in pairs(windows) do
			if vim.api.nvim_win_get_config(win)["relative"] == "" then
				local buftype = vim.api.nvim_buf_get_option(arg.buf, "filetype")
				if buftype == "notify" or buftype == "noice" then
					return
				end
				local space = M.spacebar(win)
				local filename = M.getFileName()
				if filename == "" then
					return
				end
				vim.api.nvim_win_set_option(
					win,
					"winbar",
					space .. "( " .. "%{%v:lua.status.getFileName()%}" .. " )" .. space
				)
			end
		end
	end,
})
return M
