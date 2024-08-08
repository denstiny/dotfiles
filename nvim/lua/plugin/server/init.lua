local plugin = require("core.packers")

plugin.add({
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/nvim-cmp" },
		{ "L3MON4D3/LuaSnip" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "mrcjkb/rustaceanvim" },
		{ "aznhe21/actions-preview.nvim" },
		{ "SmiteshP/nvim-navbuddy" },
		{ "SmiteshP/nvim-navic" },
		{ "MunifTanjim/nui.nvim" },
		--{ "ray-x/navigator.lua" },
	},
	config = function()
		require("plugin.server.lsp-zero")
	end,
	event = "FileType",
})

plugin.add({
	"zeioth/garbage-day.nvim",
	dependencies = "neovim/nvim-lspconfig",
	opts = {
		notifications = true,
		excluded_lsp_clients = { "lua_ls", "rust-analyzer" },
	},
	event = "LspAttach",
})

plugin.add({
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		--"HiPhish/nvim-ts-rainbow2",
		"nvim-treesitter/playground",
	},
	config = function()
		require("plugin.server.treesitter")
	end,
	cmd = { "TSEnable", "TSInstall", "TSInstallInfo", "TSModuleInfo" },
	--cond = true,
})

plugin.add({
	"L3MON4D3/LuaSnip",
	config = function()
		require("plugin.server.snip")
	end,
	dependencies = {
		"Leiyi548/friendly-snippets",
	},
	build = "make install_jsregexp",
	lazy = true,
})

--plugin.add({
--	"tzachar/cmp-tabnine",
--	build = "./install.sh",
--	lazy = true,
--})

plugin.add({
	"folke/lazydev.nvim",
	ft = "lua",
	dependencies = {
		"Bilal2453/luvit-meta",
	},
	opts = {
		library = {
			-- See the configuration section for more details
			-- Load luvit types when the `vim.uv` word is found
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
		},
	},
})

plugin.add({
	"p00f/clangd_extensions.nvim",
	ft = { "cpp", "c" },
})
