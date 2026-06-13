local autocmd = require("core.autocmd").autocmd

local backlist = { "qf", "NvimTree" }
local function on_backlist(filetype)
	for _, v in pairs(backlist) do
		if v == filetype then
			return true
		end
	end
	return false
end

autocmd({ "BufWinEnter" }, {
	group = "userconfig",
	desc = "return cursor to where it was last time closing the file",
	pattern = "*",
	command = 'silent! normal! g`"zv',
})

autocmd({ "WinEnter" }, {
	callback = function(opt)
		local filetype = vim.api.nvim_get_option_value("filetype", { buf = opt.buf })
		if vim.fn.winnr("$") == 1 and on_backlist(filetype) then
			vim.cmd.quit()
		end
	end,
})

--- 自动格式化
autocmd({ "BufWritePre" }, {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

--- disabled auto fold indentation
--- autocmd({ "LspAttach" }, { command = [[set formatoptions-=cro]] })
vim.cmd([[
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

--- treesitter lazy load
autocmd({ "FileType" }, {
	callback = function(opt)
		if opt.event == "BufNewFile" then
			vim.cmd("TSEnable highlight")
			vim.cmd("TSEnable rainbow")
			return
		end
		local max_filesize = 50 * 1024 -- 50 KB
		local status, stat = pcall(vim.loop.fs_stat, opt.file)
		if status and stat then
			if stat.size > max_filesize then
				vim.defer_fn(function()
					vim.cmd("TSEnable highlight")
				end, 0)
			else
				vim.cmd("TSEnable highlight")
			end
		end
	end,
})

autocmd("UiEnter", {
	callback = function()
		if vim.fn.argc() == 0 then
			vim.defer_fn(function()
				vim.cmd("Alpha")
			end, 0)
		end
	end,
})

autocmd({ "BufNewFile" }, { command = "TemplateInit" })

autocmd({ "BufEnter" }, {
	pattern = "*.ui",
	callback = function(e)
		local cmd = "designer "
		vim.fn.jobstart(cmd .. e.file)
	end,
})

autocmd({ "BufEnter" }, {
	pattern = "*.qml",
	callback = function()
		vim.bo.filetype = "qmljs"
	end,
})
