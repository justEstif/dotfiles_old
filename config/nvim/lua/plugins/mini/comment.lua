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

