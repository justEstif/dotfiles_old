local status_ok, colorscheme = pcall(require, "github-theme")
if not status_ok then
	return
end

colorscheme.setup()
vim.cmd("colorscheme github_dark_dimmed")
