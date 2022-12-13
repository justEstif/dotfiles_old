local status, indentscope = pcall(require, "mini.indentscope")
if not status then
	print("mini.indentscope error")
	return
end

indentscope.setup({
	draw = {
		animation = indentscope.gen_animation.none(),
	},
})
