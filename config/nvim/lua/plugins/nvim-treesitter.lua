local status, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

nvim_treesitter.setup({
	ensure_installed = {
		"comment", -- slows down ts
		"css",
		"diff",
		"fish",
		"gitcommit",
		"gitignore",
		"fish",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"prisma",
		"python",
		"sql",
		"tsx",
		"typescript",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true, -- enable extension
		additional_vim_regex_highlighting = { "markdown" },
	},
	indent = { enable = true }, -- indent
	context_commentstring = { enable = true, enable_autocmd = false }, -- comments(plugin)
})
