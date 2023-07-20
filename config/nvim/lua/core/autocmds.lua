local autocmd = vim.api.nvim_create_autocmd
local autogroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

autocmd("TextYankPost", {
	desc = "highlight on yank",
	group = autogroup,
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = "200" })
	end,
})

autocmd("BufEnter", {
	desc = "Disable New Line Comment",
	group = autogroup,
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})
