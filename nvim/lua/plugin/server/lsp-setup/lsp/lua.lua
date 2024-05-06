--local M = {
--	settings = {
--		Lua = {
--			workspace = {
--				checkThirdParty = false,
--			},
--		},
--	},
--}

local M = {
	settings = {
		Lua = {
			diagnostics = {
				enable = true,
				globals = { "vim" },
				disable = { "lowercase-global" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					["/usr/share/lua/5.3"] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					--["/usr/share/awesome/lib"] = true,
					--[lspconfig.util.find_git_ancestor(vim.fn.expand("%:p"))] = true,
					--[vim.fn.expand("~/.local/share/xmake/core/language/language.lua")] = true,
				},
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
			completion = {
				--callSnippet = "Replace",
				callSnippet = "Both",
				keywordSnippet = "Both",
				displayContext = 2,
				postfix = ":",
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
}


return M
