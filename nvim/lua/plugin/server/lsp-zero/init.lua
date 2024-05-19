local lsp_zero = require("lsp-zero")
require("lspconfig").intelephense.setup({})
local handlers = require("plugin.server.lsp-zero.handlers")
lsp_zero.on_attach(function(client, bufnr)
	vim.lsp.inlay_hint.enable(true)
	handlers.lsp_keymaps(bufnr)
end)

vim.g.rustaceanvim = {
	server = {
		capabilities = lsp_zero.get_capabilities(),
	},
}
require("mason").setup({
	PATH = "prepend",
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	pip = {
		install_args = { "--proxy", "127.0.0.1:7890" },
	},
})

local noop = lsp_zero.noop
require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
		rust_analyzer = noop,
		ruff_lsp = noop,
		pylsp = noop,
	},
})

lsp_zero.set_server_config({
	capabilities = {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	},
})

lsp_zero.use("lua_ls", lsp_zero.nvim_lua_ls({}))
