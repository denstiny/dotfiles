local ns = vim.api.nvim_create_namespace("filetype.help")

local function ts_query_get_ranges(parser, root, query_string)
	local line_range = {}
	local query = vim.treesitter.query.parse(parser:lang(), query_string)
	for _, matches, _ in query:iter_matches(root, 0) do
		for _, match in ipairs(matches) do
			local start, _, _, stop, _, _ = unpack(vim.treesitter.get_range(match))
			if start ~= stop then
				table.insert(line_range, { start, stop })
			end
		end
	end
	return line_range
end

local function get_header_ranges(parser, root)
	local header_ranges = ts_query_get_ranges(parser, root, string.format("(line . [(h1) (h2) (h3)]) @v", type))

	-- If last line of buffer is present in ranges, you remove that range
	-- This is because, modeline is parsed as a heading in older vimdocs
	header_ranges = vim.tbl_filter(function(range)
		return range[2] ~= vim.api.nvim_buf_line_count(0)
	end, header_ranges)

	-- We combine header_ranges & tag ranges only when they overlap
	local tag_ranges = ts_query_get_ranges(parser, root, '((line . [(h1) (h2) (h3)]) . (line . (tag)+ . "\\n"?)* @v)')
	for i, header_range in ipairs(header_ranges) do -- Yes O(n^2), I don't really care.
		for _, tag_range in ipairs(tag_ranges) do
			if
				header_range[1] < tag_range[1] -- header starts first
				and header_range[2] + 1 >= tag_range[1] -- header end is farther or equal than tag start
				and header_range[2] < tag_range[2]
			then -- header end is less than tag end
				header_ranges[i][2] = tag_range[2]
			elseif
				tag_range[1] < header_range[1] -- tag starts first
				and tag_range[2] + 1 >= header_range[1] -- tag end is farther or equal than header start
				and tag_range[2] < header_range[2]
			then -- tag end is less than header end
				header_ranges[i][1] = tag_range[1]
			end
		end
	end

	return header_ranges
end

local function extmark_render_box(ranges, hl)
	for _, range in ipairs(ranges) do
		local start, stop = unpack(range)
		local lines = vim.api.nvim_buf_get_lines(0, start, stop, true)
		local max_line_width = vim.iter(lines):fold(0, function(acc, line)
			return math.max(acc, vim.fn.strdisplaywidth(line) + 2)
		end)

		-- If dashes are already present above line, we reuse that line for top border
		local dashes_above = lines[1]:match("^-*$") or lines[1]:match("^=*$")
		local border_top = "╭" .. ("─"):rep(max_line_width) .. "╮"
		if dashes_above then
			vim.api.nvim_buf_set_extmark(0, ns, start, 0, {
				virt_text = { { border_top, hl } },
				virt_text_pos = "overlay",
			})
		else
			vim.api.nvim_buf_set_extmark(0, ns, start, 0, {
				virt_lines = { { { border_top, hl } } },
				virt_lines_above = true,
			})
		end

		-- Render bottom border
		local border_bottom = "╰" .. ("─"):rep(max_line_width) .. "╯"
		vim.api.nvim_buf_set_extmark(0, ns, stop, 0, {
			virt_lines = { { { border_bottom, hl } } },
			virt_lines_above = true,
		})

		-- Render left and right border
		for i = start, stop - 1 do
			if i ~= start or not dashes_above then
				vim.api.nvim_buf_set_extmark(0, ns, i, 0, {
					virt_text = { { "│ ", hl } },
					virt_text_pos = "inline",
				})
				vim.api.nvim_buf_set_extmark(0, ns, i, 0, {
					virt_text = { { "│", hl } },
					virt_text_win_col = max_line_width + 1,
				})
			end
		end
	end
end

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("filetype.help", {}),
	pattern = "help",
	callback = function()
		local parser = vim.treesitter.get_parser()
		local tree = parser:parse(true)
		local root = tree[1]:root()

		local code_ranges = ts_query_get_ranges(parser, root, "(code) @v")
		local header_ranges = get_header_ranges(parser, root)

		vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
		extmark_render_box(code_ranges, "Comment")
		extmark_render_box(header_ranges, "Identifier")
	end,
})
