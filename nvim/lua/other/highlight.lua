vim.cmd [[
colorscheme palenightfall
hi EndOfBuffer guifg=bg
hi NormalFloat guibg=bg
hi NormalNC    guibg=bg
hi SignColumn  guibg=bg
hi @constructor gui=bold
hi FloatBorder guifg=#5B72AE
hi TelescopeBorder guifg=#5B72AE
hi IndentBlanklineContextStart guisp=#D49BFD gui=underline
hi IndentBlanklineContextChar guifg=#D49BFD
hi VertSplit guifg=#292E42 guibg=bg
]]

local bg = vim.api.nvim_get_hl_by_name("Normal", true)["background"]
function set_hl(hl, opts)
  vim.api.nvim_set_hl(0, hl, opts)
end

-- set_hl('EndOfBuffer', { fg = bg })
-- set_hl('NormalFloat', { bg = bg })
-- set_hl('Normal', { bg = bg })
-- set_hl('NormalNC', { bg = bg })
-- set_hl('SignColumn', { bg = bg })
-- set_hl('FloatBorder', { fg = '#292E42' })
