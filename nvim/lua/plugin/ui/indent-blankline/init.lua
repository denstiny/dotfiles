--vim.opt.list = true
vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:⏎")
--vim.opt.listchars:append("nbsp:⎵")
local has_ts, indent_blankline = pcall(require, "indent_blankline")
if not has_ts then
	return
end

indent_blankline.setup({
	char = "▏",
	context_char = "▏",
	use_treesitter = true,
	show_current_context = true,
	show_current_context_start = true,
})

vim.g.indent_blankline_context_patterns = {
	"^if",
	"class",
	"^identifier",
	"do_block",
	"^function",
	"^while",
	"^for",
	"^table",
	"try",
	"except",
	"switch",
	"case",
}

vim.g.indent_blankline_filetype_exclude = {
	"help",
	"startify",
	"TERMINAL",
	"terminal",
	"packer",
	"lsp-installer",
	"",
	"startuptime",
	"toggleterm",
	"translator",
	"markdown",
	"norg",
}
vim.g.indent_blankline_show_end_of_line = false -- 占用隐藏符号
vim.g.indent_blankline_show_trailing_blankline_indent = false -- 删除多余的缩进线
vim.g.indent_blankline_max_indent_increase = 2
