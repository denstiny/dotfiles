require("basis.option")
require("basis.hi")
require("basis.autocmd")
vim.defer_fn(function()
	require("basis.bind-key")
	require("core.winbar")
end, 0)
