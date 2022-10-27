-----------------------------------------------------------
-- Whichkey configuration file
----------------------------------------------------------

local status, whichkey = pcall(require, "which-key")
if not status then
	return
end

local conf = {
	plugins = {
		marks = false, -- shows a list of your marks on ' and `
		registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ...
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = false, -- default bindings on <c-w>
			nav = false, -- misc bindings to work with windows
			z = false, -- bindings for folds, spelling and others prefixed with z
			g = false, -- bindings for prefixed with g
		},
		spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
	},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
	},
}

local opts = {
	mode = "n", -- Normal mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
	["w"] = { "<cmd>update!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },

	["["] = {
		name = "Quick menu",
		b = { "<cmd>Telescope buffers<CR>", "Find buffer" },
		d = { "<cmd>Telescope projects<CR>", "Find project" },
		s = { "<cmd>Telescope live_grep<CR>", "Find text" },
	},

	b = {
		name = "Buffer",
		c = { "<Cmd>bd!<Cr>", "Close current buffer" },
		D = { "<Cmd>%bd<Cr>", "Delete all buffers" },
	},

	z = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	g = {
		name = "Git",
		g = { "<cmd>tab G<CR>", "Fugitive window" },
		j = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
		k = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk" },
		l = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
		p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
		r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
		R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
		s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
		u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff" },
	},

	t = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<CR>", "Find files" },
		s = { "<cmd>Telescope live_grep<CR>", "Find text" },
		b = { "<cmd>Telescope buffers<CR>", "Find buffer" },
		p = { "<cmd>Telescope projects<CR>", "Find project" },
		r = { "<cmd>Telescope reloader<CR>", "Reload dotfiles" },
	},
}

-- NOTE: Mappings for '['
local opts_2 = {
	mode = "n", -- Normal mode
	prefix = "[",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local mappings_2 = {
	b = { "<cmd>Telescope buffers<CR>", "Find buffer" },
	d = { "<cmd>Telescope projects<CR>", "Find project" },
	f = { "<cmd>NvimTreeToggle<CR>", "Open file tree" },
	s = { "<cmd>Telescope live_grep<CR>", "Find text" },
}

whichkey.setup(conf)
whichkey.register(mappings, opts) -- , keymaps
whichkey.register(mappings_2, opts_2) -- [ keymaps
