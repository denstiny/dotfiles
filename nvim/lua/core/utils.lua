local M = {}
function M.is_key_in_table(table, key)
	for k, v in pairs(table) do
		if k == key then
			return true
		end
	end
	return false
end

return M
