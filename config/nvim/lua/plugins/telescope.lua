-- Telescope
local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")

telescope.setup({

	defaults = {
		path_display = { "smart" },
		mappings = {
			i = {
				["<C-u>"] = false, -- clear input with C-u
				["<leader><leader>"] = actions.close, -- exit
				["<C-j>"] = actions.move_selection_next, -- next item
				["<C-k>"] = actions.move_selection_previous, -- previous item
				["<C-?>"] = actions.which_key, -- available keys
				["<C-w>"] = actions_layout.toggle_preview, -- toggle preview
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-q>"] = actions.smart_add_to_qflist + actions.open_qflist, -- add grep to quickfix
				["<C-f>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
			},
			n = {
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-?>"] = actions.which_key, -- see options
				["<C-w>"] = actions_layout.toggle_preview, -- toggle preview
				["<C-f>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
			},
		},

		file_ignore_patterns = { -- ignore these files
			"node_modules/.*",
			".git/.*",
			".next/.*",
			"dist/.*",
		},
		layout_strategy = "flex", -- display: flex;
	},
	pickers = { -- defining the options of different pickers
		find_files = {
			initial_mode = "insert",
			theme = "dropdown",
			find_command = { "fd", "--hidden", "--no-ignore-vcs" },
		},
		buffers = {
			initial_mode = "normal",
			previewer = false,
			theme = "cursor",
		},
	},
	extensions = {},
})
