local opts = { noremap = true, silent = true }
local bufnr = vim.api.nvim_get_current_buf()
vim.api.nvim_buf_set_keymap(bufnr, "n", "gw", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
