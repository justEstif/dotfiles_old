local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = "200",
		})
	end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
	pattern = "*",
	command = "silent! :%s/\\s\\+$//e",
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})
