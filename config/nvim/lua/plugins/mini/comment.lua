local status, comment = pcall(require, "mini.comment")
if not status then
	print("mini.comment error")
	return
end

comment.setup({
	options = {
		custom_commentstring = function()
			return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
		end,
	},
})
