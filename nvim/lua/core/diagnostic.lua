local fn = vim.fn
local api = vim.api
local ns_id = vim.api.nvim_create_namespace("md-codeblaock")
local M = {}

vim.cmd([[
hi DError guibg=#2F1D29 guifg=#EB4838
hi DBError guibg=#2F1D29
hi DWarn  guibg=#322425 guifg=#FA9535
hi DBWarn  guibg=#322425
]])

local function hl_line(bufnr, line, hl, vtext)
	local text = string.rep(" ", fn.winwidth(fn.bufwinnr(bufnr)))
	local opts = {
		virt_text = { { "   " .. vtext .. text, hl.vig } },
		hl_eol = true,
		virt_text_pos = "overlay",
	}
	vim.hl.range(bufnr, ns_id, hl.gui, { line, 0 }, { line, -1 }, {})
	pcall(api.nvim_buf_set_extmark, bufnr, ns_id, line, #fn.getline(line + 1), opts)
end

local function show_diag(bufnr, level, message, lnum)
	local hl = {
		[1] = {
			gui = "DBError",
			vig = "DError",
		},
		[2] = {
			gui = "DBWarn",
			vig = "DWarn",
		},
		[3] = {
			gui = "DBWarn",
			vig = "DWarn",
		},
		[4] = {
			gui = "DBWarn",
			vig = "DWarn",
		},
		[5] = {
			gui = "DBWarn",
			vig = "DWarn",
		},
	}
	hl_line(bufnr, lnum, hl[level], message)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, _, _)
	if not result.diagnostics then
		return
	end
	local bufnr = vim.uri_to_bufnr(result.uri)
	vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
	for _, diagnostic in ipairs(result.diagnostics) do
		local line = diagnostic.range.start.line
		local severity = diagnostic.severity
		local message = diagnostic.message
		show_diag(bufnr, severity, message, line)
	end
end
return M
