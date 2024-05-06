local M = {}

function M.build_require(path)
	local opt = {}
	opt.path = path
	opt.require = function(name)
		return require(opt.path .. name)
	end
	return opt
end

return M
