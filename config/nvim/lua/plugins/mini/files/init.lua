local toggle_hidden = require("plugins.mini.files.toggle_hidden")
local set_cwd = require("plugins.mini.files.set_cwd")
local open_in_split = require("plugins.mini.files.open_in_split")

return {
	"echasnovski/mini.files",
	opts = {
		mappings = {
			go_in = "L",
			go_in_plus = "l",
			go_out = "H",
			go_out_plus = "h",
		},
	},
	config = function(_, opts)
		local files = require("mini.files")
		files.setup(opts)
		toggle_hidden(files)
		set_cwd(files)
		open_in_split(files)
	end,
}
