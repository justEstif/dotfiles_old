local status, theme = pcall(require, "catppuccin")
if not status then
	print("theme error")
	return
end

theme.setup({
	flavour = "macchiato", -- latte, frappe, macchiato, mocha
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		mini = true,
		markdown = true,
		treesitter = true,
		native_lsp = { enabled = true },
	},
})

vim.cmd.colorscheme("catppuccin")
