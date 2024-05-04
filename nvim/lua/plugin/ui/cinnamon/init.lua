require("cinnamon").setup({ -- KEYMAPS:
	default_keymaps = true, -- Create default keymaps.
	extra_keymaps = false, -- Create extra keymaps.
	extended_keymaps = false, -- Create extended keymaps.
	override_keymaps = false, -- The plugin keymaps will override any existing keymaps.

	-- OPTIONS:
	always_scroll = false, -- Scroll the cursor even when the window hasn't scrolled.
	centered = true, -- Keep cursor centered in window when using window scrolling.
	disabled = false, -- Disables the plugin.
	default_delay = 7, -- The default delay (in ms) between each line when scrolling.
	hide_cursor = false, -- Hide the cursor while scrolling. Requires enabling termguicolors!
	horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
	max_length = -1, -- Maximum length (in ms) of a command. The line delay will be
	-- re-calculated. Setting to -1 will disable this option.
	scroll_limit = 100, -- Max number of lines moved before scrolling is skipped. Setting
	-- to -1 will disable this option.
})
vim.keymap.set("n", "n", "<Cmd>lua Scroll('n')<CR>")
vim.keymap.set("n", "N", "<Cmd>lua Scroll('N')<CR>")
-- Up/down movements:
vim.keymap.set({ "n", "x" }, "k", "<Cmd>lua Scroll('k', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "j", "<Cmd>lua Scroll('j', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Up>", "<Cmd>lua Scroll('k', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Down>", "<Cmd>lua Scroll('j', 0, 1)<CR>")

-- Left/right movements:
vim.keymap.set({ "n", "x" }, "h", "<Cmd>lua Scroll('h', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "l", "<Cmd>lua Scroll('l', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Left>", "<Cmd>lua Scroll('h', 0, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<Right>", "<Cmd>lua Scroll('l', 0, 1)<CR>")
vim.keymap.set("n", "zz", "<Cmd>lua Scroll('zz', 0, 1)<CR>")
-- Start/end of file and line number movements:
vim.keymap.set({ "n", "x" }, "gg", "<Cmd>lua Scroll('gg')<CR>")
vim.keymap.set({ "n", "x" }, "G", "<Cmd>lua Scroll('G', 0, 1)<CR>")

-- Start/end of line:
vim.keymap.set({ "n", "x" }, "0", "<Cmd>lua Scroll('0')<CR>")
vim.keymap.set({ "n", "x" }, "^", "<Cmd>lua Scroll('^')<CR>")
vim.keymap.set({ "n", "x" }, "$", "<Cmd>lua Scroll('$', 0, 1)<CR>")

-- Paragraph movements:
vim.keymap.set({ "n", "x" }, "{", "<Cmd>lua Scroll('{')<CR>")
vim.keymap.set({ "n", "x" }, "}", "<Cmd>lua Scroll('}')<CR>")

-- Previous/next search result:
vim.keymap.set("n", "n", "<Cmd>lua Scroll('n', 1)<CR>")
vim.keymap.set("n", "N", "<Cmd>lua Scroll('N', 1)<CR>")
vim.keymap.set("n", "*", "<Cmd>lua Scroll('*', 1)<CR>")
vim.keymap.set("n", "#", "<Cmd>lua Scroll('#', 1)<CR>")
vim.keymap.set("n", "g*", "<Cmd>lua Scroll('g*', 1)<CR>")
vim.keymap.set("n", "g#", "<Cmd>lua Scroll('g#', 1)<CR>")

-- Half-window movements:
vim.keymap.set({ "n", "x" }, "<C-u>", "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<C-d>", "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")

-- Page movements:
vim.keymap.set({ "n", "x" }, "<C-b>", "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<C-f>", "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<PageUp>", "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
vim.keymap.set({ "n", "x" }, "<PageDown>", "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")
