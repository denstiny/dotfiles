local plugin = require("core.packers")

plugin.add({
	"hrsh7th/nvim-cmp",
	config = function()
		require("plugin.ui.cmp")
	end,
	dependencies = {
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-cmdline" },
		{ "onsails/lspkind-nvim" },
		{ "hrsh7th/cmp-buffer", option = { keyword_pattern = [[\k\+]] } },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-calc" },
		--{ "dmitmel/cmp-digraphs" },
		{ "f3fora/cmp-spell" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "lukas-reineke/cmp-under-comparator" },
	},
	--event = "InsertEnter",
	--event = "LspAttach",
})

plugin.add({
	"rcarriga/nvim-notify",
	config = function()
		require("plugin.ui.notify")
	end,
	event = "UiEnter",
	cond = true,
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
	event = { "WinLeave" },
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
	cond = false,
})

plugin.add({
	"nvimdev/hlsearch.nvim",
	event = { "SearchWrapped", "CursorMoved" },
	config = function()
		require("hlsearch").setup()
	end,
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
	event = "UiEnter",
})

plugin.add({
	"petertriho/nvim-scrollbar",
	desc = "滚动条",
	config = function()
		require("plugin.ui.scroll.scrollbar")
	end,
	event = { "BufReadPre", "BufNewFile" },
	cond = false,
})

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
	cond = true,
})

plugin.add({
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	branch = "dev",
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
			},
			indent = {
				enable = false,
			},
			blank = {
				enable = true,
			},
		})
	end,
	cond = false,
})

plugin.add({
	"nvimdev/indentmini.nvim",
	config = function()
		require("indentmini").setup() -- use default config
	end,
	cond = false,
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
	dependencies = {
		"rose-pine/neovim",
		"rebelot/kanagawa.nvim",
		--"AlexvZyl/nordic.nvim",
	},
	config = function()
		require("plugin.ui.color-patch")
	end,
	event = "UiEnter",
	cond = false,
})

plugin.add({
	"mcchrish/zenbones.nvim",
	dependencies = {
		"rktjmp/lush.nvim",
	},
	config = function()
		vim.opt.termguicolors = true
		vim.opt.background = "light"
		vim.cmd("colorscheme zenbones")
		require("core.chronus-theme")()
		vim.cmd("hi NoiceCmdlinePopupBorder guifg=#786D68")
		vim.cmd("hi NoiceCmdlinePopupTitle guifg=#786d68")
		vim.cmd("hi NoiceCmdlineIcon guifg=#44525b")
		vim.cmd("hi WinBar guibg=bg")
		vim.cmd("hi WinBarNC guibg=bg")
		vim.cmd("hi SmoothCursor guifg=#2C363C")
		vim.cmd("hi CocSearch guibg=bg guifg=#2C363C gui=bold")
	end,
	cond = false,
	--lazy = false,
	--event = "UiEnter",
	priority = 1000,
})

plugin.add({
	"Verf/deepwhite.nvim",
	config = function()
		vim.opt.termguicolors = true
		vim.opt.background = "light"
		vim.cmd("colorscheme deepwhite")
		--require("core.chronus-theme")()
		vim.cmd("hi NoiceCmdlinePopupBorder guifg=#786D68")
		vim.cmd("hi NoiceCmdlinePopupTitle guifg=#786d68")
		vim.cmd("hi NoiceCmdlineIcon guifg=#44525b")
		vim.cmd("hi ErrorMsg guifg=#a60000 guibg=bg")
		vim.cmd("hi WarningMsg guifg=#f27900 guibg=bg")
		vim.cmd("hi WinSeparator guifg=#888888")
		vim.cmd("hi WinBar guibg=bg")
		vim.cmd("hi WinBarNC guibg=bg")
		vim.cmd("hi SmoothCursor guifg=#2C363C")

		--vim.cmd("hi FoldColumn guifg=#999791")
	end,
	priority = 1000,
	cond = true,
})

plugin.add({
	"dstein64/nvim-scrollview",
	desc = "滚动条",
	config = function()
		require("plugin.ui.scroll.scrollview")
	end,
	event = { "BufReadPre", "BufNewFile" },
	cond = false,
})

plugin.add({
	"lukas-reineke/headlines.nvim",
	config = false, -- or `opts = {}`
	ft = { "*.md", "*.norg" },
})

plugin.add({
	"j-hui/fidget.nvim",
	config = function()
		require("fidget").setup({})
		--vim.notify = require("fidget").notify
	end,
	event = "UiEnter",
})

plugin.add({
	"declancm/cinnamon.nvim",
	config = function()
		require("plugin.ui.cinnamon")
	end,
	cond = false,
	event = "UiEnter",
})

plugin.add({
	"lewis6991/satellite.nvim",
	config = function()
		require("plugin.ui.scroll.satellite")
	end,
	event = "UiEnter",
})

plugin.add({
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("plugin.ui.noice")
	end,
	event = "UiEnter",
})

plugin.add({
	"denstiny/orig.nvim",
	opts = {},
	cond = false,
})

plugin.add({
	"chentoast/marks.nvim",
	config = function()
		require("plugin.ui.marks")
	end,
	event = "UiEnter",
	cond = false,
})

plugin.add({
	"ray-x/lsp_signature.nvim",
	lazy = true,
})

plugin.add({
	"luukvbaal/statuscol.nvim",
	branch = "0.10",
	lazy = true,
})
