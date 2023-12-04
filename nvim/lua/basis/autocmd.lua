local autocmd = require("core.autocmd").autocmd

--- {{{ close last tool win
local backlist = { "qf", "NvimTree" }
local function on_backlist(filetype)
	for _, v in pairs(backlist) do
		if v == filetype then
			return true
		end
	end
	return false
end

autocmd({ "WinEnter" }, {
	callback = function(opt)
		local filetype = vim.api.nvim_buf_get_option(opt.buf, "filetype")
		if vim.fn.winnr("$") == 1 and on_backlist(filetype) then
			vim.cmd.quit()
		end
	end,
})
-- }}}

--{{ 自动格式化
autocmd({ "BufWrite" }, {
	desc = "使用 formatter.nvim 格式化代码",
	command = "Autoformat",
})
--}}}

--{{
autocmd({ "ColorScheme" }, {
	callback = function()
		require("core.chronus-theme")()
	end,
})
--}}}

--- {{{ disabled auto fold indentation
autocmd({ "LspAttach" }, { command = [[set formatoptions-=cro]] })
---}}}

--- {{{ treesitter lazy load
autocmd({ "FileType", "BufNewFile" }, {
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
			--vim.defer_fn(function()
			--	vim.cmd("TSEnable rainbow")
			--end, 0)
		end
	end,
})

autocmd("UiEnter", {
	callback = function()
		if vim.fn.argc() == 0 then
			--vim.opt.cursorline = false
			vim.defer_fn(function()
				vim.cmd("Alpha")
			end, 0)
		end
	end,
})

--autocmd("BufLeave", {
--	callback = function()
--		if vim.bo.filetype then
--			vim.opt.cursorline = true
--		end
--	end,
--})

autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

autocmd({ "BufNewFile" }, { command = "TemplateInit" })

-- autocmd({ "ModeChanged" }, {
-- 	callback = function()
-- 		local m = vim.fn.mode()
-- 		if not require("core.noexecfile").can_exec() then
-- 			return
-- 		end
-- 		if m == "i" then
-- 			vim.opt.cursorline = false
-- 		else
-- 			vim.opt.cursorline = true
-- 		end
-- 		if m == "v" or m == "V" then
-- 			vim.cmd("hi LineNr guifg=#54546d")
-- 			vim.cmd("hi CursorLineNr guifg=#ff9e3b")
-- 		else
-- 			vim.cmd("hi LineNr guifg=#000000")
-- 			vim.cmd("hi CursorLineNr guifg=#000000 guibg=#000000")
-- 		end
-- 	end,
-- })

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
