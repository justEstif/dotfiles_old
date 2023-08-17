local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	print("lazy error")
	return
end

lazy.setup({
	{ -- code highlight
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring", -- jsx comments support
			"windwp/nvim-ts-autotag",                   --autoclose and autorename html tag
		},
		build = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			require("plugins.nvim-treesitter")
		end,
	},
	{                        -- lsp
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
	{ -- swiss knife
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.telescope")
		end,
	},
	{ -- toggle term
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.toggleterm")
		end,
	},
	{ -- scope buffers to tab page
		"tiagovla/scope.nvim",
		config = true,
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("plugins.mini")
		end,
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
	"folke/lazy.nvim",
	"kyazdani42/nvim-web-devicons", -- icons,
	"nvim-lua/plenary.nvim",
})
