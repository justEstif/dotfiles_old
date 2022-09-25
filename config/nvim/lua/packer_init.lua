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

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install plugins
return packer.startup(function(use)
	use({
		"wbthomason/packer.nvim", -- plugin manager
		"nvim-lua/plenary.nvim", -- important package used by most
		"nvim-treesitter/nvim-treesitter", -- code highlighting
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig", -- nvim native lsp
		"williamboman/nvim-lsp-installer", -- lsp installer
		"jose-elias-alvarez/typescript.nvim", -- ts config
	})

	-- Code completion
	use({
		"hrsh7th/nvim-cmp", -- cmp plugin
		"hrsh7th/cmp-nvim-lsp", -- lsp cmp
		"hrsh7th/cmp-path", -- path cmp
		"hrsh7th/cmp-buffer", -- buffer cmp
		"saadparwaiz1/cmp_luasnip", -- snippets cmp
		"L3MON4D3/LuaSnip", -- snippets engine
		"rafamadriz/friendly-snippets", -- common snippets
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim", -- telescope
		branch = "0.1.x",
		requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
	})

	-- Features
	use({ "tpope/vim-fugitive" }) -- git client
	use({ "akinsho/toggleterm.nvim", tag = "v2.*" }) -- better terminal
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- formatter
	use({ "echasnovski/mini.nvim" }) -- indent/comment/starter

	-- Improve
	use({ "tpope/vim-repeat" }) -- repeat -> hop char1
	use({ "tpope/vim-surround" }) -- surround
	use({ "tpope/vim-unimpaired" }) -- keybinds using [], and <>
	use({ "windwp/nvim-ts-autotag" }) -- autoclose and autorename html tags
	use({ "JoosepAlviste/nvim-ts-context-commentstring" }) -- jsx comments

	-- Appearance
	use({ "feline-nvim/feline.nvim" }) -- statusline
	use({ "EdenEast/nightfox.nvim", tag = "v1.0.0" }) -- colorscheme
	use({ "kyazdani42/nvim-web-devicons" }) -- icons
	use({ "junegunn/goyo.vim" }) -- zen

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
