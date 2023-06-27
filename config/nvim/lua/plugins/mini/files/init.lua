local status, files = pcall(require, "mini.files")
if not status then
	print("mini.files error")
	return
end

local toggle_dotfiles = require("plugins.mini.files.toggle_dotfiles")
toggle_dotfiles(files)

files.setup({
	mappings = {
		go_in = "L",
		go_in_plus = "l",
		go_out = "H",
		go_out_plus = "h",
	},
})
