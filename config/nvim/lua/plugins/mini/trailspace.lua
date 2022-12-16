local status, trailspace = pcall(require, "mini.trailspace")
if not status then
	print("mini.trailspace error")
	return
end

trailspace.setup({})

-- Remove whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		trailspace.trim()
		trailspace.trim_last_lines()
	end,
})
