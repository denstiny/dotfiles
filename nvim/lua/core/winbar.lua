local M = {}

vim.cmd([[
  highlight WinBar           guifg=#BBBBBB gui=bold
  highlight WinBarNC         guifg=#888888 gui=bold
  ]])

M.getFileName = function()
	local name = vim.fn.expand("%:t")
	return name
end

_G.status = M
vim.o.winbar = "     %{%v:lua.status.getFileName()%}"
return M
