local plugin = require("core.packers")

plugin.add({
	"danymat/neogen",
	desc = "注释",
	config = function()
		require("plugin.tool.neogen")
	end,
	cmd = "Neogen",
})

plugin.add({
	"windwp/nvim-autopairs",
	config = function()
		require("plugin.tool.autopairs")
	end,
	event = "InsertEnter",
})

--plugin.add({
--	"vim-autoformat/vim-autoformat",
--	config = function()
--		require("plugin.tool.format")
--	end,
--	cmd = "Autoformat",
--})

plugin.add({
	"alohaia/fcitx.nvim",
	config = function()
		require("plugin.tool.fcitx")
	end,
	event = "InsertEnter",
})

plugin.add({
	"skywind3000/asyncrun.vim",
	dependencies = {
		{ "skywind3000/asynctasks.vim" },
	},
	config = function()
		require("plugin.tool.asyntask")
	end,
	cmd = "AsyncTask",
})

plugin.add({
	"tibabit/vim-templates",
	desc = "文件模板",
	config = function()
		require("plugin.tool.template")
	end,
	cmd = "TemplateInit",
})

--plugin.add({
--	"ggandor/leap.nvim",
--	desc = "快速移动",
--	config = function()
--		require("plugin.tool.leap")
--	end,
--	event = { "UiEnter" },
--})

plugin.add({
	"iamcco/markdown-preview.nvim",
	build = "cd app && npx --yes yarn install",
	ft = { "markdown", "plaintex" },
})

plugin.add({
	"mg979/vim-visual-multi",
	desc = "多光标",
	keys = {
		{ "<C-n>", mode = "n" },
		{ "<C-n>", mode = "v" },
		{ "<C-n>", mode = "x" },
	},
})

plugin.add({
	"kylechui/nvim-surround",
	desc = "块包裹符号替换修改插件",
	config = function()
		require("plugin.tool.surround")
	end,
	keys = {
		{ "as", mode = "v" },
		{ "cs", mode = "n" },
		{ "ds", mode = "n" },
	},
})

plugin.add({
	"glepnir/lspsaga.nvim",
	config = function()
		require("plugin.tool.lspaga")
	end,
	--commit = "3654252",
	event = "LspAttach",
	cond = false,
})

plugin.add({
	"akinsho/toggleterm.nvim",
	dependencies = {
		"willothy/flatten.nvim",
	},
	config = function()
		require("plugin.tool.terminal")
	end,
	cmd = "ToggleTerm",
})

plugin.add({
	"willothy/flatten.nvim",
	config = function()
		require("plugin.ui.flatten")
	end,
})

plugin.add({
	"nvim-telescope/telescope.nvim",
	dependencies = {},
	config = function()
		require("plugin.tool.telescope")
	end,
	cmd = "Telescope",
	event = { "LspAttach" },
})

plugin.add({
	"ruifm/gitlinker.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("plugin.tool.gitlinker")
	end,
	event = "UiEnter",
})

plugin.add({
	"junegunn/vim-easy-align",
	config = function()
		require("plugin.tool.align")
	end,
	event = "UiEnter",
})

plugin.add({
	"Kohirus/cppassist.nvim",
	opt = true,
	ft = { "h", "cpp", "hpp", "c", "cc", "cxx" },
	config = function()
		require("cppassist").setup()
	end,
	cond = false,
})

plugin.add({
	"jakemason/ouroboros",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	ft = { "h", "cpp", "hpp", "c", "cc", "cxx" },
})

plugin.add({
	desc = "自动关闭未编辑的缓冲区",
	"axkirillov/hbac.nvim",
	config = function()
		require("hbac").setup()
	end,
	event = "UiEnter",
	cond = false,
})

plugin.add({
	desc = "编辑服务器文件",
	"chipsenkbeil/distant.nvim",
	branch = "v0.2",
	config = function()
		require("plugin.tool.distant")
	end,
	cond = false,
})

plugin.add({
	desc = "异步格式化",
	"stevearc/conform.nvim",
	config = function()
		require("plugin.tool.format")
	end,
	lazy = true,
})

plugin.add({
	desc = "注释边框",
	"LudoPinelli/comment-box.nvim",
	config = function() end,
	event = "FileType",
	cond = false,
})

plugin.add({
	"folke/ts-comments.nvim",
	config = function()
		require("plugin.tool.comments")
	end,
	enabled = vim.fn.has("nvim-0.10.0") == 1,
	event = "VeryLazy",
})

plugin.add({
	desc = "异步同步文件到服务器",
	"coffebar/transfer.nvim",
	cmd = { "TransferInit", "DiffRemote", "TransferUpload", "TransferDownload", "TransferDirDiff", "TransferRepeat" },
	opts = {},
})

plugin.add({
	desc = "代码折叠",
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	event = "UiEnter",
	config = function()
		require("plugin.tool.ufo")
	end,
})

plugin.add({
	desc = "文档文件lsp支持",
	"jmbuhr/otter.nvim",
	config = function()
		require("plugin.tool.otter")
	end,
	cond = false,
})

--plugin.add({
--    "chentoast/marks.nvim",
--    config = function ()
--        require("plugin.tool.marks")
--    end,
--    event = "UiEnter"
--})

plugin.add({
	"olimorris/persisted.nvim",
	config = function()
		require("plugin.tool.session")
	end,
	event = "UiEnter",
})

plugin.add({
	"yaocccc/nvim-foldsign",
	event = "CursorHold",
	config = function()
		require("nvim-foldsign").setup({
			offset = -2,
		})
	end,
	cond = false,
})

plugin.add({
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({})
	end,
	event = "UiEnter",
})

plugin.add({
	"gnikdroy/projections.nvim",
	config = function()
		require("plugin.tool.projects")
	end,
	branch = "pre_release",
	cond = false,
})

plugin.add({
	"abecodes/tabout.nvim",
	config = function()
		require("plugin.tool.tabout")
	end,
	event = "InsertEnter",
	cond = false,
})

plugin.add({
	"vidocqh/auto-indent.nvim",
	opts = {
		indentexpr = function(lnum)
			return require("nvim-treesitter.indent").get_indent(lnum)
		end,
	},
	event = "InsertEnter",
})

plugin.add({
	"ziontee113/syntax-tree-surfer",
	config = function()
		require("plugin.tool.surfer")
	end,
	keys = {
		{ "vU", mode = "n" },
		{ "vD", mode = "n" },
		{ "vd", mode = "n" },
		{ "vd", mode = "n" },
		{ "vu", mode = "n" },
		{ "vx", mode = "n" },
		{ "vn", mode = "n" },
		{ "J", mode = "x" },
		{ "K", mode = "x" },
		{ "H", mode = "x" },
		{ "L", mode = "x" },
		{ "<A-j>", mode = "x" },
		{ "<A-K>", mode = "x" },
	},
})

plugin.add({
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			char = {
				keys = {},
			},
		},
	},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
})

plugin.add({
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		require("plugin.tool.dap")
	end,
	cmd = { "DapContinue", "DapToggleBreakpoint", "DapLoadLaunchJSON" },
})

plugin.add({
	"potamides/pantran.nvim",
	config = function()
		require("pantran").setup({
			default_engine = "yandex",
			engines = {
				yandex = {
					default_source = "auto",
					default_target = "zh",
				},
				deepl = {
					default_source = "auto",
					default_target = "zh",
				},
			},
		})
	end,
	cmd = { "Pantran" },
})

plugin.add({
	"denstiny/karasync.nvim",
	config = function()
		require("karasync").setup()
	end,
	event = "UiEnter",
})

plugin.add({
	desc = "真辣鸡",
	"chrisgrieser/nvim-origami",
	event = "BufReadPost", -- later or on keypress would prevent saving folds
	opts = {
		keepFoldsAcrossSessions = true,
		pauseFoldsOnSearch = false,
		setupFoldKeymaps = false,
	}, -- needed even when using default config
	cond = false,
})
