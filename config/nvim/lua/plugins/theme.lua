local status, theme = pcall(require, "tokyonight")
if not status then
	print("tokyonight error")
	return
end

theme.setup({
	style = "storm", -- strong, moon, night
	light_style = "day", -- day(light)
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
	},
})

vim.cmd([[colorscheme tokyonight]])
