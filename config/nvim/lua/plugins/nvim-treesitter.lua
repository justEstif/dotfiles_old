-- Nvim Treesitter
local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

nvim_treesitter.setup({
	ensure_installed = {
		"css",
		"html",
		"javascript",
		"typescript",
		"tsx",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"comment",
		"fish",
		"diff",
		"gitcommit",
		"gitignore",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true, -- enable extension
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true }, -- indent
	context_commentstring = { enable = true, enable_autocmd = false }, -- comments(plugin)
	matchup = { enable = "true" }, -- matchup(plugin)
})
