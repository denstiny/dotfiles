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

plugin.add({
	"vim-autoformat/vim-autoformat",
	config = function()
		require("plugin.tool.format")
	end,
	cmd = "Autoformat",
})

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

plugin.add({
	"ggandor/leap.nvim",
	desc = "快速移动",
	config = function()
		require("plugin.tool.leap")
	end,
	event = { "UiEnter" },
})

plugin.add({
	"iamcco/markdown-preview.nvim",
	build = "cd app && yarn install",
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
		{ "S", mode = "v" },
		{ "cs", mode = "n" },
		{ "ds", mode = "n" },
	},
})

plugin.add({
	"glepnir/lspsaga.nvim",
	config = function()
		require("plugin.tool.lspaga")
	end,
	commit = "3654252",
	event = "LspAttach",
})

plugin.add({
	"akinsho/toggleterm.nvim",
	config = function()
		require("plugin.tool.terminal")
	end,
	cmd = "ToggleTerm",
})

plugin.add({
	"nvim-telescope/telescope.nvim",
	config = function()
		require("plugin.tool.telescope")
	end,
	cmd = "Telescope",
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
