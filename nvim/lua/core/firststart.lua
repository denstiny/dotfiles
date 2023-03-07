-- Automatically install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end
lazy.setup(
	require("core.utils").mergeTable({
		{
			"RRethy/nvim-base16",
			config = function()
				vim.cmd("colorscheme base16-darktooth")
			end,
		},
		{
			"freddiehaddad/feline.nvim",
			config = function()
				vim.opt.termguicolors = true
				require("packers.feline_config")
			end,
			dependencies = {
				{ "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
			},
		},
	}, require("packers.packer")),
	require("packers.lazy")
)
