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

local same = function (idx)
	return f(function (args)
		return args[1]
	end,{idx})
end

local function get_file_folder()
	return function()
		local path = vim.fn.expand("%:h")
		if string.sub(path, 1, string.len(vim.fn.getcwd())) == vim.fn.getcwd() then
			path = path:sub(string.len(vim.fn.getcwd()) + 2,-1)
		end
		if path:sub(1,4) == "src/" then
			path = path:sub(5,-1)
		end
		path:gsub("/","\\")
		return "\\"..path
	end
end

local function get_filename()
	return vim.fn.expand("%:t:r")
end

local function phpDocMethodReturnChoice()
	return c(1,{
				sn(1,{ t({"@param "}), i(1),t(" "), i(2, "argument_name"), t({"",""})}),
				sn(1,{t("return "), i(1), t({"",""})})
			})
end

function all_trim(s)
   return s:match( "^%s*(.-)%s*$" )
end

ls.add_snippets("php", {
	s("func",{
			t("function "),
			i(1,{"text"}),
			t("( "),
			i(2),
			t({" ) {",""}),
			i(3),
			t({"","}"}),
	}),

	s("classFile",{
		t({"<?php",""}),
		t("namespace "),
		i(1),
		f(get_file_folder()),
		t({";","","class "}),
		f(get_filename),
		t({" {","}"})
	}),

	s("arrI",{
		t('"'),
		i(1),
		t('"'),
		t(" => "),
		i(2),
		t({",",""}),
		i(0),
	}),

	s("arr", {
		t({"["}),
		isn(1,{
			t({"",""}),
			i(1),
		},"$PARENT_INDENT	"),
		t({"","];"})
	}),


	s("phpdoc",{
		isn(1,{
			t({"/**",""}),
			i(2,"Describe function"),
			t({"",""}),
			phpDocMethodReturnChoice(),
			t({"",""}),
		},"$PARENT_INDENT * "),

		t({"","**/"})
	}),

	s("phpdoc2",{
		isn(1,{
			t({"/**",""}),
			i(2,"Describe function"),
			t({"",""}),
			
			t({"",""}),
		},"$PARENT_INDENT * "),

		t({"","**/"})
	}),

	s("add_filter", fmt([[
		add_filter('{}', '{}');
	]], {i(1, 'the_content'), i(2, 'my_function')})),

	s("add_filter_fn", fmt([[
		add_filter('{}', '{}');	
		function {}({}) {{
			{}
		}}
	]], {
		i(1),
		i(2),
		same(2),
		i(3),
		i(4),
	})),

	s("add_action", fmt([[
		add_action('{}', '{}');
	]], {i(1, 'the_content'), i(2, 'my_function')})),

	s("add_action_fn", fmt([[
		add_action('{}', '{}');	
		function {}({}) {{
			{}
		}}
	]], {
		i(1),
		i(2),
		same(2),
		i(3),
		i(4),
	})),


	s({trig="func[>%s](.*)%s", regTrig=true, snippetType="autosnippet"}, fmt([[
		function {}(){{
			{}
		}}

	]],
	{
		d(1,function(_,snip)
			return sn(1, t(snip.captures[1]))
		end),
		i(2),
	})),

	s({trig="pubfunc[>%s](.*)%s", regTrig=true, snippetType="autosnippet"}, fmt([[
		public function {}(){{
			{}
		}}
	]],
	{
		d(1,function(_,snip)
			return sn(1, t(all_trim(snip.captures[1])))
		end),
		i(0,"// TODO:"),
	})),

	s({trig="privfunc[>%s](.*)%s", regTrig=true, snippetType="autosnippet"}, fmt([[
		private function {}(){{
			{}
		}}

	]],
	{
		d(1,function(_,snip)
			return sn(1, t(snip.captures[1]))
		end),
		i(2),
	})),


	s({trig="if[>%s](.*)\\", regTrig=true, snippetType="autosnippet"},fmt( --{{{
		[[
			if ( {}) {{ 
				{}
			}}
		]],
		{
			d(1, function(_, snip)
				-- return sn(1, i(1, snip.captures[1]))
				return sn(1, t(snip.captures[1]))
			end),
			i(2,"//TODO:")
		}
	)),
	-- quick way to make a variable
	-- s({trig="$(.*)\\", name="variable", regTrig=true, snippetType="autosnippet"},
	-- 	fmt("${} = {};",{
	-- 	d(1, function(_, snip)
	-- 		return sn(1, t(snip.captures[1]))
	-- 	end),
	-- 	i(2,"value"),
	-- })),

	s({trig="get_posts"},fmt([[
		${}s = get_posts([
			'post_type'	=> "{}",
			'posts_per_page' => {},
			{}
		]);
	]],{
		same(1),
		i(1,"post"),
		i(2,"-1"),
		i(0)
	})),

	s(
		{trig="tern"},
		fmt([[
			{} ? {} : {};
		]],
		{
			i(1,"condition"),
			i(2,"primary_value"),
			c(3, {
				t("null"),
				i(1,""),
			})
		}
		)
	),

	s(
		{trig="log",name="log me"  },
		fmt("error_log(print_r({},true));",{
			i(1,"value"),
		})),

})




