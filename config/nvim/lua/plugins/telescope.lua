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
				["<C-w>"] = actions_layout.toggle_preview, -- toggle preview
				["<C-?>"] = actions.which_key, -- available keys
			},
			n = {
				["<leader><leader>"] = actions.close, -- exit
				["<C-w>"] = actions_layout.toggle_preview, -- toggle preview
			},
		},

		file_ignore_patterns = { "node_modules/.*", ".git/.*", ".next/.*", "dist/.*", ".obsidian/.*" },
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
				"!yarn.lock",
				"!yarn.lock",
				"!pnpm-lock.yaml",
				"!CONTRIBUTING.md",
			},
		},
		spell_suggest = {
			theme = "cursor",
			initial_mode = "normal",
		},
	},
})
