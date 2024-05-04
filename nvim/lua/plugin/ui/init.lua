local plugin = require("core.packers")

plugin.add({
	"hrsh7th/nvim-cmp",
	config = function()
		require("plugin.ui.cmp")
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
	},
	--event = "InsertEnter",
	event = "LspAttach",
})

plugin.add({
	"rcarriga/nvim-notify",
	config = function()
		require("plugin.ui.notify")
	end,
	event = "UiEnter",
})

plugin.add({
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		--{ "antosha417/nvim-lsp-file-operations" },
	},
	config = function()
		require("plugin.ui.nvimtree")
	end,
	tag = "nightly",
	cmd = { "NvimTreeFindFileToggle", "NvimTreeOpen" },
})

plugin.add({
	"dstein64/vim-startuptime",
	cmd = "StartupTime",
})

plugin.add({
	branch = "alpha",
	"nvim-zh/colorful-winsep.nvim",
	config = function()
		require("plugin.ui.winsep")
	end,
	event = { "WinNew" },
})

plugin.add({
	"goolord/alpha-nvim",
	desc = "启动界面",
	config = function()
		if vim.fn.argc() == 0 then
			require("plugin.ui.alpha")
		end
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	cmd = "Alpha",
	--lazy = false,
})

plugin.add({
	"kevinhwang91/nvim-hlslens",
	config = function()
		require("plugin.ui.hlslens")
	end,
	event = { "SearchWrapped", "CursorMoved" },
})

plugin.add({
	"mbbill/undotree",
	desc = "撤销树",
	config = function()
		require("plugin.tool.undotree")
	end,
	cmd = "UndotreeToggle",
})

plugin.add({
	"lewis6991/gitsigns.nvim",
	desc = "git 信息",
	config = function()
		require("plugin.tool.git")
	end,
	cmd = "Gitsigns",
})

--plugin.add({
--	"petertriho/nvim-scrollbar",
--	desc = "滚动条",
--	config = function()
--		require("plugin.ui.scroll")
--	end,
--	event = { "BufReadPre", "BufNewFile" },
--})

plugin.add({
	"brenoprata10/nvim-highlight-colors",
	desc = "高亮16进制编码颜色",
	config = function()
		require("plugin.ui.colord")
	end,
	ft = { "html", "lua", "css" },
	event = { "BufReadPre *.conf" },
})

--plugin.add({
--    "rebelot/kanagawa.nvim",
--    config = function()
--        require("plugin.ui.theme.kanagawa")
--    end,
--    event = "UiEnter",
--    cond = false,
--})

plugin.add({
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("plugin.ui.theme.rose-pine")
	end,
	cond = false,
	event = "UiEnter",
})

plugin.add({
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		require("plugin.ui.indent-blankline")
	end,
	event = "UiEnter",
})

plugin.add({
	"folke/todo-comments.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = true,
	event = "UiEnter",
})

plugin.add({
	"gen740/SmoothCursor.nvim",
	config = function()
		require("plugin.ui.SmoothCursor")
	end,
	event = "UiEnter",
})

plugin.add({
	"AlexvZyl/nordic.nvim",
	config = function()
		require("plugin.ui.theme.nordic")
	end,
	cond = false,
	event = "UiEnter",
})

plugin.add({
	"akinsho/horizon.nvim",
	config = function()
		require("plugin.ui.theme.horizon")
	end,
	cond = false,
	event = "UiEnter",
})

plugin.add({
	"folke/tokyonight.nvim",
	config = function()
		require("plugin.ui.theme.tokyonight")
	end,
	cond = false,
	event = "UiEnter",
})

plugin.add({
	"denstiny/color-patch.nvim",
	dependencies = "rebelot/kanagawa.nvim",
	config = function()
		require("plugin.ui.color-patch")
	end,
	event = "UiEnter",
})

plugin.add({
	"dstein64/nvim-scrollview",
	desc = "滚动条",
	config = function()
		require("plugin.ui.scroll")
	end,
	event = { "BufReadPre", "BufNewFile" },
})

plugin.add({
	"lukas-reineke/headlines.nvim",
	config = false, -- or `opts = {}`
})

plugin.add({
	"j-hui/fidget.nvim",
	opts = {
		-- options
	},
	event = "LspAttach",
})

plugin.add({
	"declancm/cinnamon.nvim",
	config = function()
		require("plugin.ui.cinnamon")
	end,
	event = "UiEnter",
})

plugin.add({
	"lewis6991/satellite.nvim",
	config = function()
		require("plugin.ui.scroll")
	end,
	cond = false,
})
