require("projections").setup({
	workspaces = { -- Default workspaces to search for
		{ "~/Documents/dev", { ".git" } },
		{ "~/repos", {} },
		{ "~/Public/", { ".git", "pyproject.toml" } },
		{ "~/.local/share/nvim/lazy", { ".git", "pyproject.toml" } },
	},
})

-- Bind <leader>fp to Telescope projections
require("telescope").load_extension("projections")
vim.keymap.set("n", "<leader>fp", function()
	vim.cmd("Telescope projections")
end)

-- Autostore session on VimExit
local Session = require("projections.session")
vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
	callback = function()
		Session.store(vim.loop.cwd())
	end,
})

-- Switch to project if vim was started in a project dir
local switcher = require("projections.switcher")
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		if vim.fn.argc() == 0 then
			switcher.switch(vim.loop.cwd())
		end
	end,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		if vim.fn.argc() ~= 0 then
			return
		end
		local session_info = Session.info(vim.loop.cwd())
		if session_info == nil then
			Session.restore_latest()
		else
			Session.restore(vim.loop.cwd())
		end
	end,
	desc = "Restore last session automatically",
})
local Session = require("projections.session")
vim.api.nvim_create_user_command("StoreProjectSession", function()
	Session.store(vim.loop.cwd())
end, {})

vim.api.nvim_create_user_command("RestoreProjectSession", function()
	Session.restore(vim.loop.cwd())
end, {})

require("telescope").load_extension("projections")

vim.api.nvim_create_autocmd({ "SessionLoadPost" }, {
	callback = function()
		local bufs = vim.api.nvim_list_bufs()
		for _, buf in ipairs(bufs) do
			local filename = vim.api.nvim_buf_get_name(buf) -- 获取 buffer 的文件名
			filename = vim.fn.fnamemodify(filename, ":t") -- 从完整路径中提取文件名
			if filename == "NvimTree_1" then
				local status_ok, api = pcall(require, "nvim-tree.api")
				if not status_ok then
					return
				end
				api.tree.toggle({ focus = false, find_file = true })
			end
		end
	end,
})
