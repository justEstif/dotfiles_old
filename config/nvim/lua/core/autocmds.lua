-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Highlight on yank
augroup("YankHighlight", {
	clear = true,
})

autocmd("TextYankPost", {
	group = "YankHighlight",
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

-- Save folds on exit
augroup("AutoSaveFolds", {
	clear = true,
})

autocmd("BufWinLeave", {
	group = "AutoSaveFolds",
	pattern = "*",
	command = "silent! mkview",
})

-- Load folds on start
autocmd("BufWinEnter", {
	group = "AutoSaveFolds",
	pattern = "*",
	command = "silent! loadview",
})

-- Turn off line numbers in terminal
autocmd("TermOpen", {
	pattern = "*",
	command = "setlocal nonumber norelativenumber",
})
