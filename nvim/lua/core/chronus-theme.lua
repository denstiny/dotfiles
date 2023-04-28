return function()
	vim.cmd([[
        hi Normal guibg=None
        hi StatusLine guibg=bg
        hi EndOfBuffer guifg=bg
        hi LineNr      guibg=bg
        hi NormalFloat guibg=bg
        hi NormalNC    guibg=bg
        hi SignColumn  guibg=bg
        hi WinBar      guibg=bg
        hi WinBarNc    guibg=bg
        hi VertSplit   guibg=bg
        hi FloatBorder guibg=bg
        hi TelescopeBorder guibg=bg
        hi TelescopeNormal guibg=bg
        hi GitSignsChange guibg=bg
        hi GitSignsAdd guibg=bg
        hi GitSignsDelete guibg=bg
        hi TSPunctBracket guifg=#665c54
        hi clear CmpItemAbbr
        hi clear MatchParen
        hi MatchParen gui=bold,underline guisp=#92826A
        hi DiagnosticSignHint   guibg=bg 
        hi DiagnosticSignInfo   guibg=bg
        hi DiagnosticSignError  guibg=bg
        hi DiagnosticSignWarn   guibg=bg
			  hi LineNr guifg=#000000
			  hi CursorLineNr guifg=#000000 guibg=#000000
        hi NvimTreeRootFolder  guifg=#8094B4
        hi IndentBlanklineContextStart guisp=#2E303E gui=underline
        hi IndentBlanklineContextChar guifg=#2E303E
        hi IndentBlanklineChar guifg=#2E303E
        ]])
end
