local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local types = require("luasnip.util.types")

local function load()
	return {
		ls.parser.parse_snippet("body-reset", "body {\n box-sizing: border-box;\n}\nbody * {\n box-sizing:inherit;\n}"),

		s("flexrw",{
				t({
						"display:flex;",
						"justify-content:"
					}),
				c(1,{
						t({"space-between;"}),
						t({"center;"}),
						t({"flex-end;"}),
					}),
				t({
						"align-items:center;",
						"gap:"
					}),
				i(2),
				t({
						";",
						"padding:"
					}),
				i(3, "20px"),
				t({
						";",
					}),
			}),
	}
end

return {
	load = load
}
