vim.cmd [[
colorscheme concoctis
hi Normal guibg=#232120
hi EndOfBuffer guifg=bg
hi NormalFloat guibg=bg
hi NormalNC    guibg=bg
hi SignColumn  guibg=bg
hi @constructor gui=bold
hi FloatBorder guifg=#5B72AE
hi WinBar guibg=bg
hi WinBarNc guibg=bg
hi TelescopeBorder guifg=#5B72AE
hi IndentBlanklineContextStart guisp=#EA6962 gui=underline
hi IndentBlanklineContextChar guifg=#EA6962
hi DiagnosticSignHint  gui=underline cterm=underline guisp=#7982B4
hi DiagnosticSignInfo  gui=underline cterm=underline guisp=#82aaff
hi DiagnosticSignError gui=undercurl cterm=undercurl guisp=#ff5370
hi DiagnosticSignWarn  gui=undercurl cterm=undercurl guisp=#f78c6c
hi LspSagaLightBulb    gui=bold
hi VertSplit guifg=#292E42 guibg=bg
]]

--local bg = vim.api.nvim_get_hl_by_name("Normal", true)["background"]
