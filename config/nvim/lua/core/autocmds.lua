local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	desc = "highlight on yank",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = "200" })
	end,
})

autocmd("BufEnter", {
	desc = "Disable New Line Comment",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})
