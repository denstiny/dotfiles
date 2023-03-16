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
			{ "hrsh7th/cmp-buffer", option = { keyword_pattern = [[\k\+]] } },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-calc" },
			{ "dmitmel/cmp-digraphs" },
			{ "f3fora/cmp-spell" },
			{ "hrsh7th/cmp-nvim-lsp" },
			--{
			--	"zbirenbaum/copilot.lua",
			--	opts = {
			--		panel = { enabled = false },
			--		suggestion = {
			--			enable = true,
			--			auto_trigger = true,
			--			keymap = false,
			--		},
			--		filetypes = {
			--			markdown = true,
			--		},
			--	},
			--},
		},
		event = "InsertEnter",
	},
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("packers.snip")
		end,
		dependencies = {
			"Leiyi548/friendly-snippets",
		},
		build = "make install_jsregexp",
		lazy = true,
	},
	{
		"danymat/neogen",
		desc = "注释",
		config = function()
			require("packers.neogen")
		end,
		event = "InsertEnter",
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
			{ "williamboman/mason.nvim", cmd = { "Mason" } },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			require("packers.lsp")
		end,
		event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"HiPhish/nvim-ts-rainbow2",
		},
		config = function()
			require("packers.treesitter")
		end,
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"nvim-treesitter/playground",
		cmd = {
			"TSPlaygroundToggle",
			"TSNodeUnderCursor",
			"TSHighlightCapturesUnderCursor",
		},
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
		event = "VeryLazy",
	},
	{
		"alohaia/fcitx.nvim",
		config = function()
			require("fcitx")({
				-- options
			})
		end,
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
		event = "VeryLazy",
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
			require("packers.term")
		end,
		cmd = "ToggleTerm",
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
		lazy = true,
	},
	{
		"goolord/alpha-nvim",
		desc = "启动界面",
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
		event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	},
	{
		"skywind3000/asyncrun.vim",
		desc = "任务管理",
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
	{ "mbbill/undotree", desc = "撤销树", cmd = "UndotreeToggle" },
	{
		"lewis6991/gitsigns.nvim",
		desc = "git 信息",
		config = function()
			require("packers.git")
		end,
		cmd = "Gitsigns",
	},
	{
		"tibabit/vim-templates",
		desc = "文件模板",
		config = function()
			require("packers.template")
		end,
		cmd = "TemplateInit",
	},
	{
		"ahmedkhalf/project.nvim",
		desc = "历史项目插件",
		config = function()
			require("packers.project")
		end,
		lazy = true,
	},
	{
		"petertriho/nvim-scrollbar",
		desc = "滚动条",
		config = function()
			require("packers.scroll")
		end,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"utilyre/barbecue.nvim",
		desc = "winbar",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
			"nvim-web-devicons",
		},
		config = function()
			require("packers.winbar")
		end,
		event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	},
	{
		"anuvyklack/windows.nvim",
		desc = "窗口缩放动画",
		cond = false,
		dependencies = {
			{ "anuvyklack/middleclass" },
			{ "anuvyklack/animation.nvim" },
		},
		config = function()
			require("packers.windows")
		end,
		event = "WinNew",
		cmd = "WindowsMaximize",
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			require("packers.telescope")
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		desc = "高亮16进制编码颜色",
		config = function()
			require("packers.colord")
		end,
		event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	},
	{
		"ggandor/leap.nvim",
		desc = "快速移动",
		config = function()
			require("packers.leap-move")
		end,
		event = { "BufReadPre", "BufWritePost", "BufNewFile" },
	},
	{
		"saecki/crates.nvim",
		desc = "rust-cmp 包提示信息",
		config = true,
		event = { "BufRead *.toml" },
	},
	{ "iamcco/markdown-preview.nvim", build = "cd app && yarn install", event = "BufRead *.md" },
	{
		"RaafatTurki/hex.nvim",
		desc = "帮助编辑二进制文件",
		config = function()
			require("packers.neozoom")
		end,
		cmd = { "HexDump", "HexAssemble", "HexToggle" },
	},
	{
		"mg979/vim-visual-multi",
		desc = "多光标",
		keys = {
			{ "<C-n>", mode = "n" },
		},
	},
	{
		"kylechui/nvim-surround",
		desc = "块包裹符号替换修改插件",
		config = function()
			require("packers.surround")
		end,
		keys = {
			{ "S", mode = "v" },
			{ "cs", mode = "n" },
			{ "ds", mode = "n" },
		},
	},
	{
		"tamton-aquib/keys.nvim",
		config = true,
		cmd = "KeysToggle",
	},
	{
		"linty-org/readline.nvim",
		config = function()
			local readline = require("readline")
			vim.keymap.set("!", "<M-f>", readline.forward_word)
			vim.keymap.set("!", "<M-b>", readline.backward_word)
			vim.keymap.set("!", "<C-a>", readline.beginning_of_line)
			vim.keymap.set("!", "<C-e>", readline.end_of_line)
			vim.keymap.set("!", "<M-d>", readline.kill_word)
			vim.keymap.set("!", "<M-BS>", readline.backward_kill_word)
			vim.keymap.set("!", "<C-k>", readline.kill_line)
			vim.keymap.set("!", "<C-u>", readline.backward_kill_line)
			vim.keymap.set("!", "<C-h>", "<left>")
			vim.keymap.set("!", "<C-l>", "<right>")
		end,
		event = "VeryLazy",
	},
}
