local config = {
	callbacks = {
		---Called to determine if a nested session should wait for the host to close the file.
		---@param argv table a list of all the arguments in the nested session
		---@return boolean
		should_block = require("flatten").default_should_block,
		---If this returns true, the nested session will be opened.
		---If false, default behavior is used, and
		---config.nest_if_no_args is respected.
		---@type fun(host: channel):boolean
		should_nest = require("flatten").default_should_nest,
		---Called before a nested session is opened.
		pre_open = function() end,
		---Called after a nested session is opened.
		---@param bufnr buffer
		---@param winnr window
		---@param filetype string
		---@param is_blocking boolean
		---@param is_diff boolean
		post_open = function(bufnr, winnr, filetype, is_blocking, is_diff) end,
		---Called when a nested session is done waiting for the host.
		---@param filetype string
		block_end = function(filetype) end,
	},
	-- <String, Bool> dictionary of filetypes that should be blocking
	block_for = {
		gitcommit = true,
		gitrebase = true,
	},
	-- Command passthrough
	allow_cmd_passthrough = true,
	-- Allow a nested session to open if Neovim is opened without arguments
	nest_if_no_args = false,
	-- Window options
	window = {
		-- Options:
		-- current        -> open in current window (default)
		-- alternate      -> open in alternate window (recommended)
		-- tab            -> open in new tab
		-- split          -> open in split
		-- vsplit         -> open in vsplit
		-- smart          -> smart open (avoids special buffers)
		-- OpenHandler    -> allows you to handle file opening yourself (see Types)
		--
		open = "alternate",
		-- Options:
		-- vsplit         -> opens files in diff vsplits
		-- split          -> opens files in diff splits
		-- tab_vsplit     -> creates a new tabpage, and opens diff vsplits
		-- tab_split      -> creates a new tabpage, and opens diff splits
		-- OpenHandler    -> allows you to handle file opening yourself (see Types)
		diff = "tab_vsplit",
		-- Affects which file gets focused when opening multiple at once
		-- Options:
		-- "first"        -> open first file of new files (default)
		-- "last"         -> open last file of new files
		focus = "first",
	},
	-- Override this function to use a different socket to connect to the host
	-- On the host side this can return nil or the socket address.
	-- On the guest side this should return the socket address
	-- or a non-zero channel id from `sockconnect`
	-- flatten.nvim will detect if the address refers to this instance of nvim, to determine if this is a host or a guest
	pipe_path = require("flatten").default_pipe_path,
	-- The `default_pipe_path` will treat the first nvim instance within a single kitty/wezterm session as the host
	-- You can configure this behaviour using the following opt-in integrations:
	one_per = {
		kitty = false, -- Flatten all instance in the current Kitty session
		wezterm = false, -- Flatten all instance in the current Wezterm session
	},
}

require("flatten").setup(config)
