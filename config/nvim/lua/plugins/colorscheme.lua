local status_ok, colorscheme = pcall(require, "github-theme")
if not status_ok then
	return
end

colorscheme.setup()

if os.getenv("theme") == "light" then
	vim.cmd("colorscheme github_light")
else
	vim.cmd("colorscheme github_dark_dimmed")
end
