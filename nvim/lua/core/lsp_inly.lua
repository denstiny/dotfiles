local M = {}

local function make_params(start_pos, end_pos, bufnr)
	return {
		textDocument = vim.lsp.util.make_text_document_params(bufnr),
		range = {
			-- convert to 0-index
			start = { line = start_pos[1] - 1, character = start_pos[2] },
			["end"] = { line = end_pos[1] - 1, character = end_pos[2] },
		},
	}
end

local function get_params(range, bufnr)
	return make_params(range.start, range._end, bufnr)
end

M.on_attach = function(client, bufnr, force)
	local range = {
		start = { 0, 0 },
		_end = { 28, 0 },
	}
	local params = get_params(range, bufnr)
	client.request("textDocument/inlayHint", params, function(err, result, ctx)
		vim.notify(vim.inspect(result))
	end)
end

return M
