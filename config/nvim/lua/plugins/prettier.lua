-----------------------------------------------------------
-- Prettier configuration file
----------------------------------------------------------

local status, prettier = pcall(require, "prettier")
if not status then
	return
end

prettier.setup({
	bin = "prettier", -- or `prettierd`
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
	cli_options = {
		semi = false,
		bracket_same_line = true,
		trailing_comma = "none",
	},
})
