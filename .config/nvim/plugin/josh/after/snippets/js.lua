local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local isn = ls.indent_snippet_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local types = require("luasnip.util.types")

local javascriptBasedSnippets = {
	s({trig="clg" }, fmt("console.log({{{}}})", {i(1,"value")}))
}

ls.add_snippets("javascript", javascriptBasedSnippets)
ls.add_snippets("typescript", javascriptBasedSnippets)
ls.add_snippets("javascriptreact",javascriptBasedSnippets)
ls.add_snippets("typescriptreact",javascriptBasedSnippets)
ls.add_snippets("svelte",javascriptBasedSnippets)
