local status, theme = pcall(require, "catppuccin")
if not status then
	print("catppuccin error")
	return
end

theme.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	options = {
		cursorline = true,
	},
	custom_highlights = function(colors)
		return {
			MiniStatuslineDevinfo = { fg = colors.red },
		}
	end,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = false,
		mini = true,
		treesitter = true,
	},
})

vim.cmd.colorscheme("catppuccin-macchiato")
-- vim.cmd.colorscheme("catppuccin-latte")
