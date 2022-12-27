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
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-treesitter/nvim-treesitter" }, -- treesitter
	{ "windwp/nvim-ts-autotag" }, -- autoclose and autorename html tags
	{ "JoosepAlviste/nvim-ts-context-commentstring" }, -- jsx comments support
	{
		"neovim/nvim-lspconfig", -- nvim native lsp
		"williamboman/mason.nvim", -- Installer for external tools
		"williamboman/mason-lspconfig.nvim", -- mason extension for lspconfig
		"jose-elias-alvarez/typescript.nvim", -- add features to tsserver config
	},
	{
		"hrsh7th/nvim-cmp", -- cmp plugin
		"hrsh7th/cmp-nvim-lsp", -- lsp cmp
		"hrsh7th/cmp-path", -- path cmp
		"hrsh7th/cmp-buffer", -- buffer cmp
		"saadparwaiz1/cmp_luasnip", -- snippets cmp
		"L3MON4D3/LuaSnip", -- snippets engine
	},
	{ "kyazdani42/nvim-tree.lua" }, -- file explorer
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
	},

	{ "tpope/vim-fugitive" }, -- git client
	{ "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" }, -- git signs

	{ "jose-elias-alvarez/null-ls.nvim" }, -- formatter
	{ "echasnovski/mini.nvim" }, -- pairs/indent/comment
	{ "wakatime/vim-wakatime" }, -- wakatime
	{ "akinsho/toggleterm.nvim" }, -- toggle term
	{ "tiagovla/scope.nvim" }, -- scope buffers to tabs
	{
		"phaazon/mind.nvim",
		branch = "v2.2",
		requires = { "nvim-lua/plenary.nvim" },
	},

	{ "kyazdani42/nvim-web-devicons" }, -- icons
	{ "catppuccin/nvim", as = "catppuccin" }, -- theme
})
