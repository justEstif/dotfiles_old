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
		comments = { italic = true }, -- Specify style for comments
		keywords = { italic = true }, -- Specify style for keywords
		functions = { bold = true }, -- Specify style for functions
		variables = {}, -- Specify style for variables
		string = { italic = true }, -- Specify style for string
		underline = true, -- true/false; use undercurl globally
		undercurl = true, -- true/false; use underline globally
	},
})

vim.cmd([[colorscheme NeoSolarized]])
