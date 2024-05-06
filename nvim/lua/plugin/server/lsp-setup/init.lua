local PATH = "plugin.server.lsp-setup."
local req = require("core.require").build_require(PATH).require
local handlers = req("handlers")

require("lsp-setup").setup({
	on_attach = handlers.on_attach,
	capabilities = handlers.make_client_capabilities(),
	servers = {
		["lua_ls"] = req("lsp.lua"),
		["pyright"] = {},
		--pylsp = {
		--	settings = {
		--		pylsp = {
		--			configurationSources = { "flake8" },
		--			plugins = {
		--				pycodestyle = {
		--					enabled = false,
		--				},
		--				mccabe = {
		--					enabled = false,
		--				},
		--				pyflakes = {
		--					enabled = false,
		--				},
		--				flake8 = {
		--					enabled = true,
		--				},
		--				pylint = {
		--					enabled = false,
		--					args = {},
		--				},
		--				black = {
		--					enabled = true,
		--				},
		--			},
		--		},
		--	},
		--},
		["cmake"] = {},
		["bashls"] = {},
		["vimls"] = {},
		["texlab"] = {},
		["jsonls"] = {},
		["clangd"] = req("lsp.clangd"),
		["gopls"] = {},
		["rust_analyzer"] = function()
			require("rust-tools").setup({
				server = {
					settings = {
						["rust-analyzer"] = {
							cargo = {
								loadOutDirsFromCheck = true,
							},
							procMacro = {
								enable = true,
							},
						},
					},
				},
			})
			-- no need to return anything
		end,
		["volar"] = {},
	},
})
