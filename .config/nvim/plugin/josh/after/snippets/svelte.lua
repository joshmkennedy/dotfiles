local ls = require("luasnip")
local _ = require("snippets.utils")

ls.add_snippets("svelte",{
	_.s("scr",{
		_.t("<script lang='ts'>"),
		_.i(0),
		_.t("</script>")
	}),
})



