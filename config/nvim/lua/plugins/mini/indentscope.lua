local status, indentscope = pcall(require, "mini.indentscope")
if not status then
	print("mini.jump error")
	return
end

indentscope.setup({
	draw = {
		delay = 0,
	},
})
