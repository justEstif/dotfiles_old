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
	use("wbthomason/packer.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"JoosepAlviste/nvim-ts-context-commentstring", -- jsx comments support
		"windwp/nvim-ts-autotag", --autoclose and autorename html tag
	})

	use({ -- lsp
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"jose-elias-alvarez/typescript.nvim",
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({ -- completion/cmp
		"hrsh7th/nvim-cmp", -- cmp plugin
		"hrsh7th/cmp-nvim-lsp", -- lsp cmp
		"hrsh7th/cmp-path", -- path cmp
		"hrsh7th/cmp-buffer", -- buffer cmp
		"saadparwaiz1/cmp_luasnip", -- snippets cmp
		"L3MON4D3/LuaSnip", -- snippets engine
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons },
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.x",
		requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" },
	})

	use({ "akinsho/toggleterm.nvim" })
	use({ "chomosuke/term-edit.nvim" })
	use({ "tiagovla/scope.nvim" })
	use({ "echasnovski/mini.nvim" })

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({ "catppuccin/nvim", as = "catppuccin" })

	use({
		"kyazdani42/nvim-web-devicons", -- icons,
		"nvim-lua/plenary.nvim",
	})
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
