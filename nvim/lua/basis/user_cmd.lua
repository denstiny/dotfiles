local opt = { bang = true }

vim.api.nvim_create_user_command("RestartCmp", "lua=require('cmp').setup.buffer{enabled=true}", opt)
