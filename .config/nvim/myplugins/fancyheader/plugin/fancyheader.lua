local bw = require("phpdockit.bufwriter")

local function get_padchar_string(pad_char_l, pad_char_r)
	local padchar_start = pad_char_l or "--[  "
	local padchar_end = pad_char_r or pad_char_l or "  ]--"
	local padchar_fmt = padchar_start .. "%s" .. padchar_end
	return padchar_fmt
end

local function line(content )
	return string.format(vim.opt.commentstring:get(), content)
end

local borderchars = {side="│",cap="─",lt_corner="╭",rt_corner="╮",rb_corner="╯",lb_corner="╰"}

local function wrap_with_fanciness(heading, indent)
	if indent==nil then
		indent = 0
	end
	local headingContent = string.format(
		get_padchar_string(borderchars.side.."    [" .. (" "):rep(3), (" "):rep(3) .. "]    "..borderchars.side),
			-- comment border paddingstring heading
		heading
	)
	local linelen = #headingContent
	P(indent)
	return {
		(" "):rep(indent) .. line(borderchars.lt_corner..(borderchars.cap):rep(linelen - 6)..borderchars.rt_corner),
		(" "):rep(indent) .. line(headingContent),
		(" "):rep(indent) .. line(borderchars.lb_corner..(borderchars.cap):rep(linelen - 6)..borderchars.rb_corner),
	}
end
vim.api.nvim_create_user_command("Fheader", function(opts)
	local heading = opts.args
	if #heading <= 0 then
		heading = vim.fn.input("> ")
	end

	local initial_cursor_pos = vim.api.nvim_win_get_cursor(0)
	vim.cmd[[normal ^]]
	local indent = vim.api.nvim_win_get_cursor(0)[2]
	local content = wrap_with_fanciness(heading, indent)
	bw.write(initial_cursor_pos[1] - 1, content)
end, {
	nargs = "*",
})
