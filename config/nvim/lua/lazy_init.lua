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
	"nvim-lua/plenary.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring", -- jsx comments support
		},
		config = function()
			require("plugins.nvim-treesitter")
		end,
	},
	{ "windwp/nvim-ts-autotag", config = true }, -- autoclose and autorename html tags
	{
		"neovim/nvim-lspconfig", -- nvim native lsp
		dependencies = {
			"williamboman/mason.nvim", -- Installer for external tools
			"williamboman/mason-lspconfig.nvim", -- mason extension for lspconfig
			"jose-elias-alvarez/typescript.nvim", -- add features to tsserver config
		},
		config = function()
			require("plugins.lsp")
		end,
	},
	{
		"hrsh7th/nvim-cmp", -- cmp plugin
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- lsp cmp
			"hrsh7th/cmp-path", -- path cmp
			"hrsh7th/cmp-buffer", -- buffer cmp
			"saadparwaiz1/cmp_luasnip", -- snippets cmp
			{
				"L3MON4D3/LuaSnip", -- snippets engine
				config = function()
					require("plugins.luasnip")
				end,
			},
		},
		config = function()
			require("plugins.nvim-cmp")
		end,
	},
	{ -- file explorer
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins.nvim-tree")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
		dependencies = {
			{
				"tiagovla/scope.nvim", -- scope buffers to tabs
				config = function()
					require("plugins.scope")
				end,
			},
		},

		config = function()
			require("plugins.telescope")
		end,
	},

	{ "tpope/vim-fugitive" }, -- git client
	{
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("plugins.gitsigns")
		end,
	}, -- git signs

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.null-ls")
		end,
	}, -- formatter
	{
		"echasnovski/mini.nvim",
		config = function()
			require("plugins.mini")
		end,
	}, -- pairs/indent/comment
	{ "wakatime/vim-wakatime" }, -- wakatime
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.toggleterm")
		end,
	}, -- toggle term
	{
		"phaazon/mind.nvim",
		branch = "v2.2",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.mind")
		end,
	},
	{
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.devicons")
		end,
	}, -- icons
	{
		"catppuccin/nvim",
		as = "catppuccin",
		lazy = false,
		config = function()
			require("plugins.theme")
		end,
	}, -- theme
})
