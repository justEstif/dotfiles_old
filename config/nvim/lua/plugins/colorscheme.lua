local status_ok, colorscheme = pcall(require, "github-theme")
if not status_ok then
	return
end

colorscheme.setup()

local function change_theme(theme)
	if theme == "light" then
		vim.cmd("colorscheme github_light")
	elseif theme == "dark" then
		vim.cmd("colorscheme github_dark_dimmed")
	else
		print("Invalid theme. Please provide 'light' or 'dark'.")
	end
end

change_theme(os.getenv("theme") or "light")

vim.api.nvim_create_user_command("Theme", function(opts)
	change_theme(opts.fargs[1])
end, {
	nargs = 1,
	complete = function(ArgLead, CmdLine, CursorPos)
		return { "light", "dark" }
	end,
})
