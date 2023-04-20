local status, theme = pcall(require, "catppuccin")
if not status then
	print("theme error")
	return
end

theme.setup({
	flavour = "macchiato", -- latte, frappe, macchiato, mocha
})

vim.cmd.colorscheme("catppuccin")
