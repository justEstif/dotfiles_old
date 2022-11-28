-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

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
	use({ "wbthomason/packer.nvim", "nvim-lua/plenary.nvim" })

	-- Treesitter: code highlighting
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "andymass/vim-matchup" }) -- add more match to %
	use({ "windwp/nvim-ts-autotag" }) -- autoclose and autorename html tags
	use({ "JoosepAlviste/nvim-ts-context-commentstring" }) -- jsx comments support

	-- LSP
	use({
		"neovim/nvim-lspconfig", -- nvim native lsp
		"williamboman/mason.nvim", -- Installer for external tools
		"williamboman/mason-lspconfig.nvim", -- mason extension for lspconfig
		"jose-elias-alvarez/typescript.nvim", -- add features to tsserver config
	})

	-- Code completion
	use({
		"hrsh7th/nvim-cmp", -- cmp plugin
		"hrsh7th/cmp-nvim-lsp", -- lsp cmp
		"hrsh7th/cmp-path", -- path cmp
		"hrsh7th/cmp-buffer", -- buffer cmp
		"saadparwaiz1/cmp_luasnip", -- snippets cmp
		"L3MON4D3/LuaSnip", -- snippets engine
	})

	-- Files
	use({ "kyazdani42/nvim-tree.lua" }) -- file explorer
	use({ "zane-/cder.nvim" }) -- tc: change working dir
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
	})

	-- Git
	use({ "tpope/vim-fugitive" }) -- git client
	use({ "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" }) -- git signs

	-- Features
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- formatter
	use({ "echasnovski/mini.nvim" }) -- pairs/indent/comment
	use({ "akinsho/toggleterm.nvim", tag = "v2.*" }) -- better terminal
	use({ "wakatime/vim-wakatime" }) -- wakatime

	-- Apperance
	use({ "kyazdani42/nvim-web-devicons" }) -- icons
	use({ "catppuccin/nvim", as = "catppuccin" }) -- theme

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
