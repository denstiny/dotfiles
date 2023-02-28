return {
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("packers.cmp-config")
		end,
		dependencies = {
			{ "hrsh7th/cmp-nvim-lua" },
			{ "onsails/lspkind-nvim" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-calc" },
			{ "dmitmel/cmp-digraphs" },
			{ "f3fora/cmp-spell" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-cmdline" },
		},
		event = "InsertEnter",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			require("packers.luasnip")
		end,
		lazy = true,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("packers.autopairs")
		end,
		event = "InsertEnter",
	},
	{ "tzachar/cmp-tabnine", build = "./install.sh", lazy = true },
	{
		"vim-autoformat/vim-autoformat",
		config = function()
			require("packers.format")
		end,
		cmd = "Autoformat",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/playground" },
		},
		config = function()
			require("packers.treesitter")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			require("packers.lsp")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{ "mfussenegger/nvim-dap" },
			{ "jayp0521/mason-nvim-dap.nvim" },
			{ "p00f/clangd_extensions.nvim" },
			{ "simrat39/rust-tools.nvim" },
		},
		config = function()
			require("packers.dap")
		end,
		cmd = {
			"DapContinue",
			"DapRestart",
			"DapClose",
			"DapToggleBreakpoint",
			"DapStepOver",
			"DapStepInto",
			"DapToggleRepl",
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("packers.lsp_signature")
		end,
		event = "CursorMovedI",
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.opt.termguicolors = true
			vim.notify = require("notify")
			vim.notify.setup({
				background_colour = "#16161E",
			})
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "antosha417/nvim-lsp-file-operations" },
		},
		config = function()
			require("packers.nvimtree")
		end,
		tag = "nightly",
		cmd = "NvimTreeFindFileToggle",
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("packers.toggleterm")
			require("core.tree-term")
		end,
	},
	{ "dstein64/vim-startuptime", cmd = "StartupTime" },
	{
		"nvim-zh/colorful-winsep.nvim",
		config = function()
			require("packers.nvimsep")
		end,
		event = { "WinNew" },
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			{ "kevinhwang91/promise-async" },
		},
		config = function()
			require("packers.ufo-config")
		end,
	},
	{
		"goolord/alpha-nvim",
		config = function()
			require("packers.alpa-config")
		end,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
	},
	{
		"glepnir/lspsaga.nvim",
		config = function()
			require("packers.lsp_saga")
		end,
	},
	{
		"skywind3000/asyncrun.vim",
		dependencies = {
			{ "skywind3000/asynctasks.vim" },
		},
		config = function()
			require("packers.asynrun")
		end,
		cmd = "AsyncTask",
	},
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("packers.hlslens-config")
		end,
		event = { "SearchWrapped", "CursorMoved" },
	},
	{ "mbbill/undotree", cmd = "UndotreeToggle" },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("packers.git")
		end,
		cmd = "Gitsigns",
	},
	{
		"tibabit/vim-templates",
		config = function()
			require("packers.template")
		end,
	},
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("packers.project")
		end,
		lazy = true,
	},
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("packers.scroll")
		end,
	},
	{
		"utilyre/barbecue.nvim",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
			"nvim-web-devicons",
		},
		config = function()
			require("packers.winbar")
		end,
	},
	{
		"anuvyklack/windows.nvim",
		dependencies = {
			{ "anuvyklack/middleclass" },
			{ "anuvyklack/animation.nvim" },
		},
		config = function()
			require("packers.windows")
		end,
		event = "WinNew",
	},
}
