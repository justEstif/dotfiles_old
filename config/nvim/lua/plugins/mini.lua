-----------------------------------------------------------
-- Mini configuration file
----------------------------------------------------------

-- Mini pairs
local status_pair, mini_pairs = pcall(require, "mini.pairs")
if not status_pair then
	print("mini.pairs error")
	return
end

mini_pairs.setup({})

-- Mini comment
local status_comment, mini_comment = pcall(require, "mini.comment")
if not status_comment then
	print("mini.comment error")
	return
end

mini_comment.setup({
	hooks = {
		pre = function()
			require("ts_context_commentstring.internal").update_commentstring()
		end,
	},
})

-- Mini jump2d
local status_jump2d, mini_jump2d = pcall(require, "mini.jump2d")
if not status_jump2d then
	print("mini.jump2d error")
	return
end

mini_jump2d.setup({
	mappings = {
		start_jumping = "<BS>",
	},
})

-- Mini tabline
local status_tabline, mini_tabline = pcall(require, "mini.tabline")
if not status_tabline then
	print("mini.tabline error")
	return
end

mini_tabline.setup()
