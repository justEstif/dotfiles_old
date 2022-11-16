-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------
local status, theme = pcall(require, "catppuccin")
if not status then
	return
end

-- Lua
theme.setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	styles = {
		comments = {},
		conditionals = {},
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
		mini = true,
		mason = true,
	},
})

vim.cmd([[colorscheme catppuccin-macchiato]])
