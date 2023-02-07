local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
	desc = "highlight on yank",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = "200" })
	end,
})

autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	desc = "Disable New Line Comment",
})

-- autocmd("CmdWinEnter", {
-- 	pattern = "*",
-- 	callback = function()
-- 		require("cmp").setup({ enabled = false })
-- 	end,
-- })

-- autocmd("CmdWinLeave", {
-- 	pattern = "*",
-- 	callback = function()
-- 		require("cmp").setup({ enabled = true })
-- 	end,
-- })

-- autocmd("CmdlineEnter", {
-- 	command = "command! Term :botright vsplit term://$SHELL",
-- })

autocmd("TermOpen", {
	callback = function()
		vim.opt_local.relativenumber = false
		vim.opt_local.number = false
		vim.opt_local.cursorline = false
	end,
	desc = "Terminal Options",
})
