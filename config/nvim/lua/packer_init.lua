-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Install plugins
return packer.startup(function(use)
	use({
		"wbthomason/packer.nvim",
		"nvim-lua/plenary.nvim",
	})

	use({
		"kyazdani42/nvim-web-devicons", -- icons,
		config = function()
			require("plugins.devicons")
		end,
	})

	use({
		"JoosepAlviste/nvim-ts-context-commentstring", -- jsx comments support
		"windwp/nvim-ts-autotag", --autoclose and autorename html tag
		{
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("plugins.nvim-treesitter")
			end,
		},
	})

	use({ -- lsp
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"jose-elias-alvarez/typescript.nvim",
		{
			"neovim/nvim-lspconfig",
			config = function()
				require("plugins.lsp")
			end,
		},
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.null-ls")
		end,
	})

	use({ -- completion/cmp
		"hrsh7th/cmp-nvim-lsp", -- lsp cmp
		"hrsh7th/cmp-path", -- path cmp
		"hrsh7th/cmp-buffer", -- buffer cmp
		"saadparwaiz1/cmp_luasnip", -- snippets cmp
		{
			"hrsh7th/nvim-cmp", -- cmp plugin
			config = function()
				require("plugins.nvim-cmp")
			end,
		},
		{
			"L3MON4D3/LuaSnip", -- snippets engine
			config = function()
				require("plugins.luasnip")
			end,
		},
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons },
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = function()
			require("plugins.nvim-tree")
		end,
	})

	use({
		"ibhagwan/fzf-lua",
		config = function()
			require("plugins.fzf-lua")
		end,
	})

	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.toggleterm")
		end,
	})

	use({
		"tiagovla/scope.nvim",
		config = function()
			require("plugins.scope")
		end,
	})

	use({
		"echasnovski/mini.nvim",
		config = function()
			require("plugins.mini")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.gitsigns")
		end,
	})

	use({
		"folke/tokyonight.nvim",
		config = function()
			require("plugins.theme")
		end,
	})

	use({
		"jakewvincent/mkdnflow.nvim",
		rocks = "luautf8", -- Ensures optional luautf8 dependency is installed
		config = function()
			require("plugins.mkdnflow")
		end,
	})
	use({
		"epwalsh/obsidian.nvim",
		config = function()
			require("plugins.obsidian")
		end,
	})

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
