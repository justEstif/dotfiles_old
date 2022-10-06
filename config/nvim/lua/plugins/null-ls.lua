-----------------------------------------------------------
-- Null-ls (Formatter) configuration file
----------------------------------------------------------

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier, -- prettier
		code_actions.eslint, -- eslint
		formatting.rustywind,
		formatting.stylua, -- lua
		completion.spell.with({
			filetypes = { "markdown", "gitcommit" },
		}),
	},
})
