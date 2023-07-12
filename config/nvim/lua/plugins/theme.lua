local status_ok, theme = pcall(require, "catppuccin")
if not status_ok then
	return
end

theme.setup({
	no_italic = true, -- Force no italic
	background = {
		light = "latte",
		dark = "mocha",
	},
})

vim.o.background = os.getenv("theme") or "dark"
vim.cmd.colorscheme("catppuccin")
