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
	desc = "don't auto comment new lines",
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})

autogroup("DisableCmp", { clear = true })
autocmd("CmdWinEnter", {
	pattern = "*",
  group = "DisableCmp",
	callback = function()
		require("cmp").setup({ enabled = false })
	end,
})

autocmd("CmdWinLeave", {
	pattern = "*",
  group = "DisableCmp",
	callback = function()
		require("cmp").setup({ enabled = true })
	end,
})
