local U = require("core.bind-tool")
U.vmap(
	"<leader>gb",
	'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>'
)
U.nmap(
	"<leader>gb",
	'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>'
)
