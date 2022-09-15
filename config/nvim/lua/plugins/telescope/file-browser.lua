local actions_status_ok, actions = pcall(require, "telescope.actions")
if not actions_status_ok then
	return
end

local file_browser = {
	initial_mode = "normal",
	path = "%:p:h", -- open the file_browser from within the folder of your current buffer
	grouped = true, -- group files and dir separately
	sorting_strategy = "ascending", -- show dir first
	previewer = false,

  results_title = false,
	layout_strategy = "horizontal",
	layout_config = {
		horizontal = {
			width = 0.6,
			height = 0.7,
		},
	},

	mappings = {
		["i"] = {
			["<C-n>"] = actions.close, -- exit
		},
		["n"] = {
			["<C-n>"] = actions.close, -- exit
		},
	},
}

return file_browser
