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
	"folke/lazy.nvim",
	"nvim-lua/plenary.nvim",
	require("plugins.autotag"),
	require("plugins.conform"),
	require("plugins.fzf"),
	require("plugins.gitsigns"),
	require("plugins.lsp"),
	require("plugins.mini.ai"),
	require("plugins.mini.align"),
	require("plugins.mini.bracketed"),
	require("plugins.mini.clue"),
	require("plugins.mini.comment"),
	require("plugins.mini.completion"),
	require("plugins.mini.files"),
	require("plugins.mini.jump"),
	require("plugins.mini.jump2d"),
	require("plugins.mini.move"),
	require("plugins.mini.operators"),
	require("plugins.mini.pairs"),
	require("plugins.mini.split-join"),
	require("plugins.mini.statusline"),
	require("plugins.mini.surround"),
	require("plugins.mini.tabline"),
	require("plugins.mini.trailspace"),
	require("plugins.scope"),
	require("plugins.theme"),
	require("plugins.treesitter"),
}, {
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"bugreport",
				"compiler",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwFileHandlers",
				"netrwPlugin",
				"netrwSettings",
				"optwin",
				"rplugin",
				"rrhelper",
				"spellfile_plugin",
				"synmenu",
				"tar",
				"tarPlugin",
				"tohtml",
				"tutor",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"loaded_ruby_provider",
				"loaded_perl_provider",
				"loaded_node_provider",
				"loaded_python3_provider",
			},
		},
	},
})
