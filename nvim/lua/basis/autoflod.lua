_G.User = {}

User.autoformat = true

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = vim.api.nvim_create_augroup("User_Group", { clear = true }),
	pattern = "*",
	callback = function()
		if User.autoformat == true then
			if vim.o.filetype == "help" then
				return
			else
				vim.cmd([[ :mkview ]])
				vim.lsp.buf.format()
				-- print("Buf Write Pre! autoFormatting") -- This message will not be seen by default
			end
		else
			-- print("Saving file... Auto format disabled!")
			return
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = vim.api.nvim_create_augroup("User_Group", { clear = false }),
	pattern = "*",
	callback = function()
		if User.autoformat == true then
			if vim.o.filetype == "help" then
				return
			else
				vim.cmd([[ :loadview ]])
				-- print("Buf Write Post! autoFormatting")
			end
		else
			-- print("Saving file... Auto format disabled!")
			return
		end
	end,
})
