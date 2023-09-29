fx_version "cerulean"
game "gta5"

author "Puntherline"
description "is lua or js more speed?" -- Can't come up with anything short and descriptive.
version "1.0"

-- Configure here
config "times" {

	-- Number of results you want to have when running any concatenation benchmark
	js_client_concat_results = 20,				-- Default: 20
	js_server_concat_results = 20,				-- Default: 20
	lua_client_concat_results = 20,				-- Default: 20
	lua_server_concat_results = 20,				-- Default: 20

	-- Number of results you want to have when running any distance calculation benchmark
	js_client_dist_results = 20,				-- Default: 20
	js_server_dist_results = 20,				-- Default: 20
	lua_client_dist_results = 20,				-- Default: 20
	lua_server_dist_results = 20,				-- Default: 20

	-- Number of iterations for concatenation type one (often used, slower)
	js_client_concat1_iterations = 10000,		-- Default: 10000 (10k)
	js_server_concat1_iterations = 10000,		-- Default: 10000 (10k)
	lua_client_concat1_iterations = 10000,		-- Default: 10000 (10k)
	lua_server_concat1_iterations = 10000,		-- Default: 10000 (10k)

	-- Number of iterations for concatenation type two (sometimes used, potentially faster)
	js_client_concat2_iterations = 10000,		-- Default: 10000 (10k)
	js_server_concat2_iterations = 10000,		-- Default: 10000 (10k)
	lua_client_concat2_iterations = 10000,		-- Default: 10000 (10k)
	lua_server_concat2_iterations = 10000,		-- Default: 10000 (10k)

	-- Number of iterations for concatenation type three (less often used, faster)
	js_client_concat3_iterations = 10000,		-- Default: 10000 (10k)
	js_server_concat3_iterations = 10000,		-- Default: 10000 (10k)
	lua_client_concat3_iterations = 10000,		-- Default: 10000 (10k)
	lua_server_concat3_iterations = 10000,		-- Default: 10000 (10k)

	-- Maximum length of the strings generated when running concatenation benchmarks
	concat_string_length = 2500,				-- Default: 2500 (2.5k)

	-- Number of iterations for distance calculation type one (ignores Z / height)
	js_client_dist1_iterations = 100000000,		-- Default: 100000000 (100 million)
	js_server_dist1_iterations = 100000000,		-- Default: 100000000 (100 million)
	lua_client_dist1_iterations = 100000000,	-- Default: 100000000 (100 million)
	lua_server_dist1_iterations = 100000000,	-- Default: 100000000 (100 million)

	-- Number of iterations for distance calculation type two (includes Z / height)
	js_client_dist2_iterations = 100000000,		-- Default: 100000000 (100 million)
	js_server_dist2_iterations = 100000000,		-- Default: 100000000 (100 million)
	lua_client_dist2_iterations = 100000000,	-- Default: 100000000 (100 million)
	lua_server_dist2_iterations = 100000000		-- Default: 100000000 (100 million)
}

client_scripts {
	"cl.js",
	"cl.lua"
}

server_scripts {
	"sv.js",
	"sv.lua"
}