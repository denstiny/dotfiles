vim.on_key(function(key, typed)
	--vim.notify(key)
	require("fidget").notify(key)
	--vim.notify(typed, "", { key = "on_key", ttl = 1, update_only = true })
end)