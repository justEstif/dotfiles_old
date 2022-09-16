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
	use({
		"wbthomason/packer.nvim", -- plugin manager
		"nvim-lua/plenary.nvim", -- important package used by most
		"nvim-treesitter/nvim-treesitter", -- code highlighting
	})

	use({ -- lsp/formating
		"neovim/nvim-lspconfig", -- nvim native lsp
		"williamboman/nvim-lsp-installer", -- lsp installer
		"jose-elias-alvarez/typescript.nvim", -- ts config
		"jose-elias-alvarez/null-ls.nvim", -- formatter
		"MunifTanjim/prettier.nvim", -- prettier
	})

	use({ -- completion/cmp
		"hrsh7th/nvim-cmp", -- cmp plugin
		"hrsh7th/cmp-nvim-lsp", -- lsp cmp
		"hrsh7th/cmp-path", -- path cmp
		"hrsh7th/cmp-buffer", -- buffer cmp
		"saadparwaiz1/cmp_luasnip", -- snippets cmp
		"L3MON4D3/LuaSnip", -- snippets engine
		"rafamadriz/friendly-snippets", -- common snippets
	})

	use({
		"nvim-telescope/telescope.nvim", -- telescope
		"nvim-telescope/telescope-file-browser.nvim", -- telescope file browser
		branch = "0.1.x",
		requires = "nvim-lua/plenary.nvim",
	})

	-- Clipboard management
	use({
		"AckslD/nvim-neoclip.lua",
		requires = { "nvim-telescope/telescope.nvim", "tami5/sqlite.lua" },
	})
	use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }) -- todo comment highlighting
	use({ "goolord/alpha-nvim", requires = "kyazdani42/nvim-web-devicons" }) -- dashboard
	use({ "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" }) -- git labels
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }) -- error viewer
	use({ "kylechui/nvim-surround" }) -- surround
	use({ "tpope/vim-abolish" }) -- search/abbrevation/var rename
	use({ "tpope/vim-fugitive" }) -- git client
	use({ "windwp/nvim-ts-autotag" }) -- autoclose and autorename html tags
	use({ "feline-nvim/feline.nvim" }) -- statusline
	use({ "JoosepAlviste/nvim-ts-context-commentstring" }) -- jsx comments
	use({ "kyazdani42/nvim-web-devicons" }) -- icons
	use({ "akinsho/toggleterm.nvim", tag = "v2.*" }) -- better terminal
	use({ "EdenEast/nightfox.nvim", tag = "v1.0.0" }) -- colorscheme
	use({ "phaazon/hop.nvim" }) -- clever s
	use({ "echasnovski/mini.nvim" }) -- improved-f/tabline/indent
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
