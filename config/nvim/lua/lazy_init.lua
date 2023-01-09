local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	print("lazy error")
	return
end

lazy.setup({
	install = {
		checker = { enabled = true },
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"tohtml",
			},
		},
	},
	{ -- code highlight
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring", -- jsx comments support
			"windwp/nvim-ts-autotag", --autoclose and autorename html tag
		},
		build = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			require("plugins.nvim-treesitter")
		end,
	},
	{ -- lsp
		"neovim/nvim-lspconfig", -- nvim native lsp
		dependencies = {
			{
				"williamboman/mason.nvim", -- Installer for external tools
				cmd = "Mason",
				config = true,
			},
			"williamboman/mason-lspconfig.nvim", -- mason extension for lspconfig
			"jose-elias-alvarez/typescript.nvim", -- add features to tsserver config
		},
		event = "BufReadPre",
		config = function()
			require("plugins.lsp")
		end,
	},
	{ -- formatting
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = { "mason.nvim" },
		config = function()
			require("plugins.null-ls")
		end,
	},
	{ -- code completion
		"hrsh7th/nvim-cmp", -- cmp plugin
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- lsp
			"hrsh7th/cmp-path", -- path
			"hrsh7th/cmp-buffer", -- buffer
			"saadparwaiz1/cmp_luasnip", -- snippets
		},
		event = "InsertEnter",
		config = function()
			require("plugins.nvim-cmp")
		end,
	},
	{
		"L3MON4D3/LuaSnip", -- snippets engine
		keys = {
			{
				"<C-l>",
				function()
					require("luasnip").jump(1)
				end,
				mode = { "i", "s" },
			},
			{
				"<C-h>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
			},
		},
		config = function()
			require("plugins.luasnip")
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins.nvim-tree")
		end,
		keys = {
			{ "<leader>f", ":NvimTreeToggle<CR>", desc = "Open Nvim tree" },
		},
	},
	{ -- swiss knife
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.telescope")
		end,
		keys = {
			{ "<leader>b", ":Telescope buffers<cr>", desc = "List open buffers" },
			{ "<leader>h", ":Telescope help_tags<cr>", desc = "help tags" },
			{ "<leader>s", ":Telescope live_grep<CR>", desc = "Search in cwd" },
			{ "<leader><leader>", ":Telescope find_files<CR>", desc = "Find files in cwd" },
			{ "z=", ":Telescope spell_suggest<CR>", desc = "Spell suggest keybind" },
		},
	},
	{ -- toggle term
		"akinsho/toggleterm.nvim",
		keys = { "<leader>t" },
		config = function()
			require("plugins.toggleterm")
		end,
	},
	{ -- scope buffers to tab page
		"tiagovla/scope.nvim",
		config = true,
	},
	{ -- swiss knife
		"echasnovski/mini.nvim",
		lazy = false,
		config = function()
			require("plugins.mini")
		end,
	},
	{
		"folke/lazy.nvim",
		keys = {
			{ "<leader>l", ":Lazy<cr>", desc = "open lazy plugin manager" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("plugins.gitsigns")
		end,
	},
	{
		"catppuccin/nvim",
		as = "catppuccin",
		lazy = false,
		config = function()
			require("plugins.theme")
		end,
	},
	"kyazdani42/nvim-web-devicons", -- icons,
	"tpope/vim-fugitive", -- git client,,
	"nvim-lua/plenary.nvim",
})
