local group = vim.api.nvim_create_augroup("denstiny_aero", { clear = true })
local tool = require("core.tool")

--- {{{ close last tool win
local backlist = { "qf", "NvimTree" }
local function on_backlist(filetype)
	for i, v in pairs(backlist) do
		if v == filetype then
			return true
		end
	end
	return false
end

vim.api.nvim_create_autocmd({ "WinEnter" }, {
	group = group,
	callback = function(opt)
		local filetype = vim.api.nvim_buf_get_option(opt.buf, "filetype")
		if vim.fn.winnr("$") == 1 and on_backlist(filetype) then
			vim.cmd.quit()
		end
	end,
})
-- }}}

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))
		if { row, col } ~= { 0, 0 } and row < vim.fn.line("$") then
			vim.api.nvim_win_set_cursor(0, { row, 0 })
		end
	end,
})

--- {{{ auto clean write output
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = group,
	desc = "自动清理命令行",
	callback = function()
		local timer = vim.loop.new_timer()
		timer:start(
			1000,
			0,
			vim.schedule_wrap(function()
				print(" ")
				timer:stop()
				timer:close()
			end)
		)
	end,
})
-- }}}

--- {{{ disabled auto fold indentation
vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter" }, {
	group = group,
	callback = function()
		vim.opt.formatoptions:remove("o")
		vim.opt.formatoptions:remove("r")
	end,
})
---}}}

--{{
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	desc = "toggterm 自动进入插入模式",
	callback = function()
		if vim.o.filetype == "toggleterm" then
			local timer = vim.loop.new_timer()
			timer:start(
				350,
				0,
				vim.schedule_wrap(function()
					vim.cmd("startinsert")
					timer:stop()
					timer:close()
				end)
			)
		end
	end,
})
--}}}

--{{ 自动格式化
vim.api.nvim_create_autocmd({ "BufWrite" }, {
	group = group,
	desc = "使用 formatter.nvim 格式化代码",
	callback = function()
		vim.cmd("Autoformat")
	end,
})
--}}}

--{{ 自动保存当前buffer编辑状态
vim.api.nvim_create_autocmd({ "BufWritePost", "BufLeave", "WinLeave" }, {
	desc = "自动创建保存会话",
	group = group,
	callback = function()
		if vim.fn.expand("%:p") ~= "" and tool.file_exists(vim.fn.expand("%:p")) then
			vim.cmd("mkview")
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	desc = "自动加载会话",
	group = group,
	callback = function(opt)
		if not tool.check_mkview(opt.file) then
			return
		end

		local filekey = tool.file_key(opt.file)
		local file_key_path = os.getenv("HOME") .. "/.vim_view/" .. filekey
		if tool.file_exists(file_key_path) then
			vim.cmd("loadview")
		end
	end,
})
--}}}
