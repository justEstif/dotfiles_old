-----------------------------------------------------------
-- Nvim Treesitter configuration file
----------------------------------------------------------

local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

nvim_treesitter.setup({
	ensure_installed = {
		"css",
		"html",
		"javascript",
		"json",
		"lua",
		"python",
		"typescript",
		"vim",
		"comment",
	},
	sync_install = false,
	highlight = {
		enable = true, -- enable extension
		additional_vim_regex_highlighting = true,
	},
	auto_install = true, -- auto install when missing parsers
	indent = {
		enable = true, -- indent based on treesitter
		disable = { "" }, -- disable treesitter indent for these langs
	},
	fold = {
		fold_one_line_after = true,
	},
	-- Comment settings
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	-- treeobjects
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
			},
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			include_surrounding_whitespace = true,
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
})
