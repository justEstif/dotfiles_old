local status, indentscope = pcall(require, "mini.indentscope")
if not status then
	print("mini.indentscope error")
	return
end

local animation = indentscope.gen_animation
indentscope.setup({
	symbol = "·",
	draw = {
		animation = animation.none(),
	},
})
