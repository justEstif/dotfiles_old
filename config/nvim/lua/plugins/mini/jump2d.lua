local status, jump2d = pcall(require, "mini.jump2d")
if not status then
	print("mini.jump error")
	return
end

jump2d.setup({
	allowed_windows = {
		current = true,
		not_current = false,
	},
	mappings = {
		start_jumping = "",
	},
	labels = "etovxqpdygfblzhckisuran",
})
