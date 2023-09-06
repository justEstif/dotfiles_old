return {
	"nvim-treesitter/nvim-treesitter",
	module = true,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring", -- jsx comments support
		"windwp/nvim-ts-autotag", --autoclose and autorename html tag
	},
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	cmd = {
		"TSInstall",
		"TSInstallInfo",
		"TSUpdate",
		"TSBufEnable",
		"TSBufDisable",
		"TSEnable",
		"TSDisable",
		"TSModuleInfo",
	},
	opts = {
		ensure_installed = {
			"comment",
			"css",
			"diff",
			"fish",
			"gitcommit",
			"gitignore",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"prisma",
			"python",
			"sql",
			"svelte",
			"tsx",
			"typescript",
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true, -- enable extension
			additional_vim_regex_highlighting = { "markdown" },
		},
		indent = { enable = true }, -- indent
		context_commentstring = { enable = true, enable_autocmd = false }, -- comments(plugin)
	},
	config = function(_, opts)
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup(opts)
	end,
}
