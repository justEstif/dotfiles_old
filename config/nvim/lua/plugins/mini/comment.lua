-- Mini comment
local status, comment = pcall(require, "mini.comment")
if not status then
	print("mini.comment error")
	return
end

comment.setup({
	hooks = {
		pre = function()
			require("ts_context_commentstring.internal").update_commentstring()
		end,
	},
})

