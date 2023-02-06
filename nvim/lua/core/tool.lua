local M = {
	interval = 500,
	cpu = 0.0,
}

--{{ 合并两个table
M.mergeTable = function(table1, table2)
	local c_table = {}
	local flag

	for k, v in ipairs(table1) do
		flag = false
		for e, value in ipairs(c_table) do
			if value == v then
				flag = true
			end
		end
		if flag == false then
			table.insert(c_table, v)
		end
	end

	for k, v in ipairs(table2) do
		flag = false
		for e, value in ipairs(c_table) do
			if value == v then
				flag = true
			end
		end
		if flag == false then
			table.insert(c_table, v)
		end
	end

	return c_table
end
--}}}

--{{ 获取当前nvim的pid
M.latest_pid = function()
	local pid_str = io.popen("ps -C nvim -o %pid | tac | awk 'NR==2 {print $1}'"):read("*a")
	local pid = string.match(pid_str, "%d+")
	return pid
end
M.pid = M.latest_pid()
--}}}

---{{ 获取当前nvim的cpu负载
M.cpu_load = function()
	local cpu_load_string = io.popen("ps -p " .. M.pid .. " -o %cpu | awk 'NR==2 {print $1}'"):read("*a")
	local cpu_load = string.match(cpu_load_string, "([0-9%.]+)")
	return cpu_load or 0
end

--}}}

-- 异步刷新
local timer = vim.loop.new_timer()
timer:start(
	0,
	M.interval,
	vim.schedule_wrap(function()
		M.cpu = M.cpu_load()
	end)
)

return M
