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
      ]])
end
