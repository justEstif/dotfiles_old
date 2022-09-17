-----------------------------------------------------------
-- Mini configuration file
----------------------------------------------------------

-- Mini jump
local status_jump, mini_jump = pcall(require, "mini.jump")
if not status_jump then
	return
end

mini_jump.setup({
	delay = {
		highlight = 150,
		idle_stop = 1000,
	},
})

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
	symbol = "|",
})

-- Mini bufremove
local status_bufremove, mini_bufremove = pcall(require, "mini.bufremove")
if not status_bufremove then
	return
end

mini_bufremove.setup({})

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

require("mini.starter").setup({
items = nil,
	footer = "",
})
