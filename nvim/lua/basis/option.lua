local opt = vim.opt
opt.showmode = false
opt.expandtab = true
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.shortmess:append("sI")
opt.viewoptions = "folds,cursor,curdir,options"
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.updatetime = 250
opt.cursorline = false
opt.laststatus = 3
opt.mouse = "ni"
opt.pumheight = 5
opt.helpheight = 10
opt.showtabline = 0
opt.viewdir = os.getenv("HOME") .. "/.vim_view/"
opt.background = "dark"
opt.guifont = "ComicCode Nerd Font:h13"
opt.clipboard:prepend("unnamed")
opt.swapfile = false
opt.statusline = " "
opt.guicursor = "i:ver20,n-v-sm:block,c-ci-ve:ver20,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
opt.cmdheight = 0
