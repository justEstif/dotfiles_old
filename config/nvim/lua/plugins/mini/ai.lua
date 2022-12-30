local status, ai = pcall(require, "mini.ai")
if not status then
	print("mini.ai error")
	return
end

local spec_treesitter = require("mini.ai").gen_spec.treesitter
ai.setup({
	n_lines = 200,
	custom_textobjects = {
		F = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
		o = spec_treesitter({
			a = { "@conditional.outer", "@loop.outer" },
			i = { "@conditional.inner", "@loop.inner" },
		}),
	},
})
