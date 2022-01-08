local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local isn = ls.indent_snippet_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local types = require("luasnip.util.types")


local parse_snippet = ls.parser.parse_snippet
function load()
	return {
		parse_snippet("cl","console.log(${1:value})"),
		
		-- Console log with the value being whats in register 0
		s("clt", {
			t("console.log({ "),
			f(function ()
				local clipboard = vim.fn.getreg('"0'):gsub('\n','')
				print( vim.inspect({clipboard}) )
					return clipboard 

				end, {}),

			t(" })"),
		}),

	-- React Component
	s("rfc",{
			t({'import React from "react"',"",""}),
			t({'export default function'}),
			i(1),
			t("({"),
			i(2),
			t({"}) {",""}),
			isn(2,{ t({"","return <h1>React Component</h1>",""})},"$PARENT_INDENT		"),
			t({"","}"})
		})
	}

end

return {load = load}
