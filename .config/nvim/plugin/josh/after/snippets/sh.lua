local ls = require("luasnip")
local _ = require("snippets.utils")

ls.add_snippets("sh",{
	_.s("#!",{
		_.t("#! /usr/bin/env bash")
	}),
},{type="autosnippets"})



