local status, move = pcall(require, "mini.move")
if not status then
	print("mini.move error")
	return
end

move.setup({
	mappings = {
		left = "<S-left>",
		right = "<S-right>",
		down = "<S-down>",
		up = "<S-up>",

		line_left = "<S-left>",
		line_right = "<S-right>",
		line_down = "<S-down>",
		line_up = "<S-up>",
	},
})
