local status, ai = pcall(require, "mini.ai")
if not status then
	print("mini.ai error")
	return
end

ai.setup({
	n_lines = 500,
	search_method = "cover_or_nearest",
	custom_textobjects = {
		F = require("mini.ai").gen_spec.treesitter({
			a = "@function.outer",
			i = "@function.inner",
		}),
	},
})
