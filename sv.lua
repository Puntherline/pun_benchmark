local config = json.decode(GetResourceMetadata("pun_benchmark", "config_extra", 0))
local concat_results = config.lua_server_concat_results
local concat1_iterations = config.lua_server_concat1_iterations
local concat2_iterations = config.lua_server_concat2_iterations
local concat3_iterations = config.lua_server_concat3_iterations
local dist_results = config.lua_server_dist_results
local dist1_iterations = config.lua_server_dist1_iterations
local dist2_iterations = config.lua_server_dist2_iterations
local concat_string_length = config.concat_string_length

local concat_string_length = config.concat_string_length

local client_starts = {}
local client_times = {}

RegisterNetEvent("pun_benchmark:start")
AddEventHandler("pun_benchmark:start", function()
	local _source = tostring(source)
	local start = os.clock() * 1000
	client_starts[_source] = start
end)

RegisterNetEvent("pun_benchmark:finish")
AddEventHandler("pun_benchmark:finish", function()
	local _source = tostring(source)
	local finish = os.clock() * 1000

	if client_times[_source] == nil then
		client_times[_source] = {}
	end

	table.insert(client_times[_source], finish - client_starts[_source])
end)

RegisterNetEvent("pun_benchmark:done")
AddEventHandler("pun_benchmark:done", function()
	local _source = source
	TriggerClientEvent("pun_benchmark:printData", _source, table.concat(client_times[tostring(_source)], "\n"))
	client_times[tostring(_source)] = {}
end)

local string_format = string.format
local string_sub = string.sub
local table_insert = table.insert
local table_concat = table.concat
local math_random = math.random
local math_floor = math.floor
local math_ceil = math.ceil

local function runConcat(variation)

	-- Wait 5 seconds before starting the benchmark
	print(string_format("Starting LUA concatenation type %d benchmark in 5 seconds.", variation))
	Wait(5000)

	-- Running benchmark x times
	local times = {}
	for i = 1, concat_results do
		local start = os.clock() * 1000

		-- Benchmark | Method one (often used)
		if variation == 1 then
			local a = ""
			for j = 1, concat1_iterations do
				for k = 1, concat_string_length do
					a = a .. "a"
				end
				a = ""
			end
		end

		-- Benchmark | Method two (sometimes used)
		if variation == 2 then
			local a = ""
			for j = 1, concat2_iterations do
				for k = 1, concat_string_length do
					a = string_format("%s%s", a, "a")
				end
				a = ""
			end
		end

		-- Benchmark | Method three (rarely used)
		if variation == 3 then
			local a = {}
			local b = ""
			for j = 1, concat3_iterations do
				for k = 1, concat_string_length do
					table_insert(a, "a")
				end
				b = table_concat(a, "")
				a = {}
				b = ""
			end
		end

		local finish = os.clock() * 1000
		table_insert(times, math_floor(finish - start))
		Wait(2000)
	end

	-- Printing out times it took
	print(table_concat(times, "\n"))
end

local function runDist(variation)

	-- Wait 5 seconds before starting the benchmark
	print(string_format("Starting LUA distance calculation type %d benchmark in 5 seconds.", variation))
	Wait(5000)

	-- Running benchmark x times
	local times = {}
	for i = 1, dist_results do
		local start = os.clock() * 1000

		-- Benchmark | Method one (excluding Z / height)
		if variation == 1 then
			local pos_1 = vector3(math_random() * 12000 - 6000, math_random() * 12000 - 6000, math_random() * 12000 - 6000)
			local pos_2 = vector3(math_random() * 12000 - 6000, math_random() * 12000 - 6000, math_random() * 12000 - 6000)
			for i = 1, dist1_iterations do
				local dist = #(pos_1.xy - pos_2.xy)
			end
		end

		-- Benchmark | Method two (including Z / height)
		if variation == 2 then
			local pos_1 = vector3(math_random() * 12000 - 6000, math_random() * 12000 - 6000, math_random() * 12000 - 6000)
			local pos_2 = vector3(math_random() * 12000 - 6000, math_random() * 12000 - 6000, math_random() * 12000 - 6000)
			for i = 1, dist2_iterations do
				local dist = #(pos_1 - pos_2)
			end
		end

		local finish = os.clock() * 1000
		table_insert(times, math_floor(finish - start))
		Wait(2000)
	end

	-- Printing out times it took
	print(table_concat(times, "\n"))
end

local function getSelectedBenchmark(source, args, raw_command)
	local test_type = string.lower(args[1])

	if test_type == "concat1" then
		runConcat(1)
	elseif test_type == "concat2" then
		runConcat(2)
	elseif test_type == "concat3" then
		runConcat(3)
	elseif test_type == "dist1" then
		runDist(1)
	elseif test_type == "dist2" then
		runDist(2)
	end
end

RegisterCommand("benchmark_lua", getSelectedBenchmark, false)