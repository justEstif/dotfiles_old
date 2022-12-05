-- Mini ai
local status_ai, mini_ai = pcall(require, "mini.ai")
if not status_ai then
	print("mini.ai error")
	return
end

mini_ai.setup({
	n_lines = 500,
	search_method = "cover_or_nearest",
	custom_textobjects = {
		F = require("mini.ai").gen_spec.treesitter({
			a = "@function.outer",
			i = "@function.inner",
		}),
	},
})
