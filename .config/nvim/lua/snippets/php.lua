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
local isn = ls.indent_snippet_node

ls.add_snippets("php",{
	s("func",{
			t("function "),			
			i(1),
			t("( "),
			i(2),
			t({" ) {",""}),
			i(3),
			t({"","}"}),
	}),

	s("if",{
			t({"if ( "}),
			i(1),
			t({" ) {"}),
			i(0),
			t({"}"}),
		}),

		ls.parser.parse_snippet("fu", "function $1 ( $2 ) { $0 }"),
		ls.parser.parse_snippet("wpaction", "add_action('$1', '$2', $3, $4);\nfunction $6 ($5){}"),
		ls.parser.parse_snippet("wpfilter", "add_filter('$1', '$2', $3, $4);\nfunction $6 ($5){}"),
		ls.parser.parse_snippet("if", "if ( $1 ) {\n $0 \n}"),
	})
ls.add_snippets("php",{
		ls.parser.parse_snippet("{{", "<?php echo $1; ?>$0"),
},{type="autosnippets"})

ls.add_snippets("sh",{
	s("#!",{
		t("#! /usr/bin/env bash")
	}),
},{type="autosnippets"})

local function load_auto()
	return 	
end

return {
	load = load,
	load_auto = load_auto
}




	

