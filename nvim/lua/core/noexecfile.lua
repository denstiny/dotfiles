local M = {}

M.nofiles = {
	"alpha",
}
M.can_exec = function()
	for i = 1, #M.nofiles do
		if vim.bo.filetype == M.nofiles[i] then
			return false
		end
	end
	return true
end

M.check_exec = function(nofiles)
	for i = 1, #nofiles do
		if vim.bo.filetype == nofiles[i] then
			return false
		end
	end
	return true
end
return M
