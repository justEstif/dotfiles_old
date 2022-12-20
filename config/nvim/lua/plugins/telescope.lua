local status, telescope = pcall(require, "telescope")
if not status then
	print("telescope error")
	return
end

local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")
local fuzzy = require("mini.fuzzy")

telescope.setup({

	defaults = {
		path_display = { "smart" },
		mappings = {
			i = {
				["<leader><leader>"] = actions.close, -- exit
				["<C-u>"] = false, -- clear input with C-u
				["<C-j>"] = actions.move_selection_next, -- next item
				["<C-k>"] = actions.move_selection_previous, -- previous item
				["<C-w>"] = actions_layout.toggle_preview, -- toggle preview
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- add selected (using tab key)
				["<C-q>"] = actions.smart_add_to_qflist + actions.open_qflist, -- add all to qflist
				["<C-?>"] = actions.which_key, -- available keys
			},
			n = {
				["<leader><leader>"] = actions.close, -- exit
				["<C-j>"] = actions.move_selection_next, -- next item
				["<C-k>"] = actions.move_selection_previous, -- previous item
				["<C-w>"] = actions_layout.toggle_preview, -- toggle preview
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- add selected (using tab key)
				["<C-q>"] = actions.smart_add_to_qflist + actions.open_qflist, -- add all to qflist
			},
		},

		file_ignore_patterns = { "node_modules/.*", ".git/.*", ".next/.*", "dist/.*" },
		layout_strategy = "flex",

		-- Use custom sorter based on more intuitive (at least for me) fuzzy logic
		file_sorter = fuzzy.get_telescope_sorter,
		generic_sorter = fuzzy.get_telescope_sorter,
	},
	pickers = {
		find_files = {
			initial_mode = "insert",
			theme = "dropdown",
			find_command = { "fd", "--hidden", "--no-ignore-vcs" },
		},
		live_grep = {
			glob_pattern = {
				"!package-lock.json",
			},
		},
		buffers = {
			initial_mode = "normal",
			theme = "cursor",
		},
		spell_suggest = {
			theme = "cursor",
		},
	},
	extensions = {
		undo = {
			initial_mode = "normal",
			side_by_side = true,
			layout_strategy = "vertical",
			layout_config = {
				preview_height = 0.8,
			},
			mappings = {
				i = {
					["<C-a>"] = require("telescope-undo.actions").yank_additions,
					["<C-d>"] = require("telescope-undo.actions").yank_deletions,
					["<C-cr>"] = require("telescope-undo.actions").restore,
				},
				n = {
					["<C-a>"] = require("telescope-undo.actions").yank_additions,
					["<C-d>"] = require("telescope-undo.actions").yank_deletions,
					["<C-cr>"] = require("telescope-undo.actions").restore,
				},
			},
		},
	},
})

telescope.load_extension("undo")
