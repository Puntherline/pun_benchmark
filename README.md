# Puntherline's Benchmark
Disclaimer: I'm not *that* experienced when it comes to both LUA and JavaScript, so you will most likely find some things that can be improved upon. If you do, I encourage you to contribute!
<br><br>


# What it does
It's supposed to run various commonly used functions in both LUA and JavaScript to see which one is faster, for both the client and the server.
<br><br>


# Commands
`[benchmark] [type]`
`benchmark`: Either `benchmark_js` or `benchmark_lua`.
`type`: Functions to run. Available tests:
- `Concat1`: String concatenation with the `..` operator in LUA and `+` operator in JS. Commonly used in scripts.
- `Concat2`: String concatenation by using `string.format` in LUA and `${}` in JS. Less common.
- `Concat3`: String concatenation via pushing to tables/objects, then joining them. Rarely used.
- `Dist1`: Calculating the distance between two random coords, excluding height.
- `Dist2`: Calculating the distance between two random coords, including height.

If you want me to add more **commonly used** functions in both languages, create an issue and ask for it. I likely won't add niche functions that are rarely used, and the function has to be benchmarkable (is that a word?), meaning that stuff like spawning vehicles is likely out of the question.
<br><br>


# Note For Contributors
If you want to contribute, I'd like to ask you to adhere to the following formatting (though it's fine if you don't, I'll fix it later):
- Indent using tabs, not spaces.
- Indent size is whatever, I use 4.
- Created functions are `camelCase` to distinguish them from default functions which use `PascalCase`.
- Variables use `snake_case`.
