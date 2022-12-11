local status, null_ls = pcall(require, "null-ls")
if not status then
  print("null-ls error")
	return
end

local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier, -- prettier
		diagnostics.jsonlint, -- json
		formatting.rustywind, -- tailwind
		formatting.stylua, -- lua
		completion.spell.with({
			filetypes = { "markdown", "gitcommit" },
		}),
	},
})
