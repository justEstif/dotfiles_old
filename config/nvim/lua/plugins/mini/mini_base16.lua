-----------------------------------------------------------
-- Mini Surround configuration file
----------------------------------------------------------

local status_colors, mini_base16 = pcall(require, "mini.base16")
if not status_colors then
	return
end

mini_base16.setup({
	palette = {
		base00 = "#2E3440", -- background
		base01 = "#3B4252", -- side and cursor line
		base02 = "#434C5E",
		base03 = "#4C566A",
		base04 = "#D8DEE9",
		base05 = "#E5E9F0",
		base06 = "#ECEFF4",
		base07 = "#8FBCBB",
		base08 = "#88C0D0",
		base09 = "#81A1C1",
		base0A = "#5E81AC",
		base0B = "#BF616A",
		base0C = "#D08770",
		base0D = "#EBCB8B",
		base0E = "#A3BE8C",
		base0F = "#B48EAD",
	},
})

vim.cmd([[hi LineNr guibg=NONE]]) -- line number
vim.cmd([[hi SignColumn guibg=NONE]]) -- signcolumn
vim.cmd([[hi VertSplit ctermbg=NONE guibg=NONE]]) -- split
-- vim.cmd([[hi Comment guifg=#ABCDEF]]) -- comment color
