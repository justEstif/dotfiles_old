-----------------------------------------------------------
-- Mini configuration file
----------------------------------------------------------

-- Mini pairs
local status_pair, mini_pairs = pcall(require, "mini.pairs")
if not status_pair then
	return
end

mini_pairs.setup({})

-- Mini indent
local status_indentscope, mini_indentscope = pcall(require, "mini.indentscope")
if not status_indentscope then
	return
end

mini_indentscope.setup({
	draw = { delay = 0 },
	symbol = "׃",
})

-- Mini comment
local status_comment, mini_comment = pcall(require, "mini.comment")
if not status_comment then
	return
end

mini_comment.setup({
	hooks = {
		pre = function()
			require("ts_context_commentstring.internal").update_commentstring()
		end,
	},
})

-- Mini Completion
local status_completion, mini_completion = pcall(require, "mini.completion")
if not status_completion then
	return
end

mini_completion.setup({
	source_func = "omnifunc",
	auto_setup = true,
})


require("plugins.mini.mini_surround")
require("plugins.mini.mini_starter")
require("plugins.mini.mini_base16")
