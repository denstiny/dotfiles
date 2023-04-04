autocmd = require("core.autocmd").autocmd

function load_lsp_config()
	require("plugin.server.lsp.mason")
	require("plugin.server.lsp.mason-lspconfig")
	require("plugin.server.lsp.lspconfig")
end

autocmd({ "BufReadPre", "BufWritePost", "BufNewFile" }, {
	callback = function()
		load_lsp_config()
	end,
})

load_lsp_config()
