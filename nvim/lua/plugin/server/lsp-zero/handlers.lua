local M = {}

local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = opts.name,
	})
end

--vim.lsp.set_log_level("off")
sign({ name = "DiagnosticSignError", text = "" })
sign({ name = "DiagnosticSignWarn", text = "" })
sign({ name = "DiagnosticSignHint", text = "" })
sign({ name = "DiagnosticSignInfo", text = "" })
--sign({ name = "DiagnosticSignError", text = "" })
--sign({ name = "DiagnosticSignWarn", text = "" })
--sign({ name = "DiagnosticSignHint", text = "" })
--sign({ name = "DiagnosticSignInfo", text = "" })

M.setup = function()
	local config = {
		virtual_text = false,
		signs = false,
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)
end

function M.lsp_keymaps(_)
	local U = require("core.bind-tool")
	local opts = { noremap = true }

	U.nmap("gd", function()
		vim.lsp.buf.definition()
	end, opts)
	U.nmap("gD", function()
		vim.lsp.buf.declaration()
	end, opts)
	U.nmap("gi", function()
		vim.lsp.buf.implementation()
	end, opts)
	U.nmap("go", function()
		vim.lsp.buf.type_definition()
	end, opts)
	U.nmap("gr", function()
		vim.cmd("Telescope lsp_references")
	end, opts)
	U.nmap("mr", function()
		vim.lsp.buf.rename()
	end, opts)
	U.nmap("gs", function()
		vim.lsp.buf.signature_help({
			border = "rounded",
		})
	end)
	U.nmap("<A-cr>", function()
		require("actions-preview").code_actions()
	end, opts)
	U.nmap("gp", function()
		vim.diagnostic.jump({ count = -1 })
	end, opts)
	U.nmap("gn", function()
		vim.diagnostic.jump({ count = 1 })
	end, opts)
	U.nmap("gl", function()
		vim.diagnostic.open_float()
	end, opts)
	U.nmap("dy", function()
		vim.cmd("Navbuddy")
	end)

	U.nmap("K", function()
		vim.lsp.buf.hover({
			border = "rounded",
			width = 80,
		})
	end)
end

function M.lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec2(
			[[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]],
			{}
		)
	end
end

function M.on_attach(client, bufnr)
	M.lsp_keymaps(bufnr)
	M.lsp_highlight_document(client)
end

function M.make_client_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.offsetEncoding = "utf-8"
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}
	capabilities.textDocument.completion.completionItem = {
		documentationFormat = { "markdown", "plaintext" },
		snippetSupport = true,
		preselectSupport = true,
		insertReplaceSupport = true,
		labelDetailsSupport = true,
		deprecatedSupport = true,
		commitCharactersSupport = true,
		tagSupport = { valueSet = { 1 } },
		resolveSupport = {
			properties = {
				"documentation",
				"detail",
				"additionalTextEdits",
			},
		},
	}
	--local cmp_nvim_lsp = require("cmp_nvim_lsp")
	--capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
	return capabilities
end

M.setup()
return M
