-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

local status, neosolarized = pcall(require, "NeoSolarized.config")
if not status then
	return
end

neosolarized.setup({
	style = "dark", -- "dark" or "light"
	transparent = true, -- true/false
	terminal_colors = true,
	enable_italics = false,
	styles = {
		comments = { italic = false }, -- Specify style for comments
		keywords = { italic = false }, -- Specify style for keywords
		functions = { bold = false }, -- Specify style for functions
		variables = {}, -- Specify style for variables
		string = { italic = false }, -- Specify style for string
		underline = true, -- true/false; use undercurl globally
		undercurl = true, -- true/false; use underline globally
	},
})

vim.cmd([[colorscheme NeoSolarized]])
