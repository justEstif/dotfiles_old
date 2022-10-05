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

-- Terminal settings:
-- Open a Terminal on the right tab
autocmd("CmdlineEnter", {
	command = "command! Term :botright vsplit term://$SHELL",
})

-- Enter insert mode when switching to terminal
autocmd("TermOpen", {
	command = "setlocal listchars= nonumber norelativenumber nocursorline",
})

autocmd("TermOpen", {
	pattern = "*",
	command = "startinsert",
})

-- Close terminal buffer on process exit
autocmd("BufLeave", {
	pattern = "term://*",
	command = "stopinsert",
})

-- Checks if there is a file open after Vim starts up,
-- and if not, open the current working directory in Netrw.
vim.cmd([[
augroup InitNetrw
  autocmd!
  autocmd VimEnter * if expand("%") == "" | edit . | endif
augroup END
]])
