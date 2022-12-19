local status, jump2d = pcall(require, "mini.jump2d")
if not status then
	print("mini.jump2d error")
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

local map = require("core.utils").map

map("n", "s", function()
	jump2d.start(jump2d.builtin_opts.single_character)
end, { desc = "Jump to single_character" })
