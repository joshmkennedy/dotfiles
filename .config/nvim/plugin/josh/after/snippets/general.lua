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

local filename = function ()
	return f(function ()
		return vim.fn.expand("%:t:r")
	end,{})
end

ls.add_snippets("all", {

	s({ trig = "filename" }, {
		filename()
	})
})
