return {
	"echasnovski/mini.ai",
	opts = {
		n_lines = 500,
		search_method = "cover_or_nearest",
		custom_textobjects = {
			g = function()
				local from = { line = 1, col = 1 }
				local to = {
					line = vim.fn.line("$"),
					col = math.max(vim.fn.getline("$"):len(), 1),
				}
				return { from = from, to = to }
			end,
		},
	},
	config = true,
}
