local status, files = pcall(require, "mini.files")
if not status then
	print("mini.files error")
	return
end

local toggle_hidden = require("plugins.mini.files.toggle_hidden")
local set_cwd = require("plugins.mini.files.set_cwd")
local open_in_split = require("plugins.mini.files.open_in_split")

files.setup({
	mappings = {
		go_in = "L",
		go_in_plus = "l",
		go_out = "H",
		go_out_plus = "h",
	},
})

toggle_hidden(files)
set_cwd(files)
open_in_split(files)
