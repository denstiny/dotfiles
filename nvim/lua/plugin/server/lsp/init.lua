function load_lsp_config()
	require("plugin.server.lsp.mason")
	require("plugin.server.lsp.mason-lspconfig")
	require("plugin.server.lsp.lspconfig")
end

load_lsp_config()
