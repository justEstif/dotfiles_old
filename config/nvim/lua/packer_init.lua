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
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter", -- code highlighting
		"nvim-treesitter/nvim-treesitter-textobjects",
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig", -- nvim native lsp
		"williamboman/mason.nvim", -- Installer for external tools
		"williamboman/mason-lspconfig.nvim", -- mason extension for lspconfig
		"jose-elias-alvarez/typescript.nvim", -- ts config
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
	})
	use({ "nvim-telescope/telescope-live-grep-args.nvim" })

	-- Features
	use({ "tpope/vim-fugitive" }) -- git client
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- formatter
	use({ "echasnovski/mini.nvim" }) -- pairs/indent/comment/starter/theme/surround/cmp

	-- Improve
	use({ "windwp/nvim-ts-autotag" }) -- autoclose and autorename html tags
	use({ "JoosepAlviste/nvim-ts-context-commentstring" }) -- jsx comments

	-- Appearance
	use({ "kyazdani42/nvim-web-devicons" }) -- icons

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
