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
		-- Whole buffer
		g = function()
			local from = { line = 1, col = 1 }
			local to = {
				line = vim.fn.line("$"),
				col = math.max(vim.fn.getline("$"):len(), 1),
			}
			return { from = from, to = to }
		end,
	},
})
