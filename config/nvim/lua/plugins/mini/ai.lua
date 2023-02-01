local status, ai = pcall(require, "mini.ai")
if not status then
	print("mini.ai error")
	return
end

ai.setup({
	n_lines = 500,
	search_method = "cover_or_nearest",
	custom_textobjects = {
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
