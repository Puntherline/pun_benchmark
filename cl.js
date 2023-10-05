const config = JSON.parse(GetResourceMetadata("pun_benchmark", "config_extra", 0));
const concat_results = config.js_server_concat_results;
const concat1_iterations = config.js_server_concat1_iterations;
const concat2_iterations = config.js_server_concat2_iterations;
const concat3_iterations = config.js_server_concat3_iterations;
const dist_results = config.js_server_dist_results;
const dist1_iterations = config.js_server_dist1_iterations;
const dist2_iterations = config.js_server_dist2_iterations;
const concat_string_length = config.concat_string_length;

Delay = (ms) => new Promise(resolve => setTimeout(resolve, ms));

async function runConcat(variation) {

	// Wait 5 seconds before starting the benchmark
	console.log(`Starting JS concatenation type ${variation} benchmark in 5 seconds.`);
	await Delay(5000);

	// Running benchmark x times
	var times = [];
	for (i = 0; i < concat_results; i++) {
		const start = Date.now();

		// Benchmark | Method one (often used)
		if (variation === 1) {
			var a = "";
			for (j = 0; j < concat1_iterations; j++) {
				for (k = 0; k < concat_string_length; k++) {
					a = a + "a";
				}
				a = "";
			}
		}

		// Benchmark | Method two (sometimes used)
		if (variation === 2) {
			var a = "";
			for (j = 0; j < concat2_iterations; j++) {
				for (k = 0; k < concat_string_length; k++) {
					a = `${a}a`;
				}
				a = "";
			}
		}

		// Benchmark | Method three (rarely used)
		if (variation === 3) {
			var a = [];
			var b = "";
			for (j = 0; j < concat3_iterations; j++) {
				for (k = 0; k < concat_string_length; k++) {
					a.push("a");
				}
				b = a.join("");
				a = [];
				b = "";
			}
		}

		const finish = Date.now();
		times.push(finish - start);
		await Delay(2000);
	}

	// Printing out times it took
	console.log(times.join("\n"));
}

async function runDist(variation) {

	// Wait 5 seconds before starting the benchmark
	console.log(`Starting JS distance calculation type ${variation} benchmark in 5 seconds.`);
	await Delay(5000);

	// Running benchmark x times
	var times = [];
	for (i = 0; i < dist_results; i++) {
		const start = Date.now();

		// Benchmark | Method one (excluding Z / height)
		if (variation === 1) {
			const pos_1 = [Math.random() * 12000 - 6000, Math.random() * 12000 - 6000, Math.random() * 12000 - 6000];
			const pos_2 = [Math.random() * 12000 - 6000, Math.random() * 12000 - 6000, Math.random() * 12000 - 6000];
			for (j = 0; j < dist1_iterations; j++) {
				const dist = Math.sqrt(Math.pow(pos_2[0] - pos_1[0], 2) + Math.pow(pos_2[1] - pos_1[1], 2));
			}
		}

		// Benchmark | Method two (including Z / height)
		if (variation === 2) {
			const pos_1 = [Math.random() * 12000 - 6000, Math.random() * 12000 - 6000, Math.random() * 12000 - 6000];
			const pos_2 = [Math.random() * 12000 - 6000, Math.random() * 12000 - 6000, Math.random() * 12000 - 6000];
			for (j = 0; j < dist2_iterations; j++) {
				const dist = Math.sqrt(Math.pow(pos_2[0] - pos_1[0], 2) + Math.pow(pos_2[1] - pos_1[1], 2) + Math.pow(pos_2[2] - pos_1[2], 2));
			}
		}

		const finish = Date.now();
		times.push(finish - start);
		await Delay(2000);
	}

	// Printing out times it took
	console.log(times.join("\n"));
}

async function getSelectedBenchmark(source, args, raw_command) {
	const test_type = args[0].toLowerCase();

	if (test_type === "concat1") {
		runConcat(1);
	} else if (test_type === "concat2") {
		runConcat(2);
	} else if (test_type === "concat3") {
		runConcat(3);
	} else if (test_type === "dist1") {
		runDist(1);
	} else if (test_type === "dist2") {
		runDist(2);
	}
}

RegisterCommand("benchmark_js", getSelectedBenchmark, false);
