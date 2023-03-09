local has_ts, toggleterm = pcall(require, "toggleterm")
if not has_ts then
	return
end

toggleterm.setup({
	open_mapping = nil,
	size = 7,
	shade_filetypes = {},
	shade_terminals = true,
	--shading_factor = '1',
	start_in_insert = true,
	persist_size = true,
	direction = "horizontal",
	highlights = {
		Normal = {
			guibg = "#1A1B26",
		},
		NormalFloat = {
			link = "Normal",
		},
	},
	on_open = function()
		local nvimtree = require("nvim-tree")
		local nvimtree_view = require("nvim-tree.view")
		if nvimtree_view.is_visible() then
			local nvimtree_width = vim.fn.winwidth(nvimtree_view.get_winnr())
			nvimtree.toggle()
			nvimtree_view.View.width = nvimtree_width
			nvimtree.toggle(false, true)
		end
	end,
})
