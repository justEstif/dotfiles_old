local _, mason = pcall(require, "mason")
local _, mason_lspconfig = pcall(require, "mason-lspconfig")
local _, lspconfig = pcall(require, "lspconfig")
local _, typescript = pcall(require, "typescript")

local on_attach_custom = function(client, bufnr)
	vim.bo.tagfunc = "v:lua.vim.lsp.tagfunc" -- use Ctrl-] to go to definition
	vim.bo.omnifunc = "v:lua.MiniCompletion.completefunc_lsp"

	local buf_map = require("core.utils").buf_map
	buf_map("n", "gh", ":lua vim.lsp.buf.hover()<CR>")
	buf_map("n", "gl", ":lua vim.diagnostic.open_float()<CR>")
	buf_map("n", "gr", ":FzfLua lsp_references<cr>")
	buf_map("n", "gT", ":lua vim.lsp.buf.type_definition()<cr>")
	buf_map("n", "=", ":lua vim.lsp.buf.format{async=true}<CR>")
	buf_map("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>")
	buf_map("n", "<C-.>", ":lua vim.lsp.buf.code_action()<CR>")

	-- Currently all formatting is handled with 'null-ls' plugin
	if vim.fn.has("nvim-0.8") == 1 then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	else
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
end

local diagnostic_opts = {
	virtual_text = false,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(diagnostic_opts)

local servers = {
	"html",
	"cssls",
	"tsserver", -- use typescript plugin
	"lua_ls",
	"jsonls",
	"tailwindcss",
	"prismals",
	"marksman",
	"eslint",
	"svelte",
	"pyright",
	"solargraph",
}

mason.setup()
mason_lspconfig.setup({ ensure_installed = servers })

lspconfig["solargraph"].setup({ on_attach = on_attach_custom })
lspconfig["svelte"].setup({ on_attach = on_attach_custom })
lspconfig["eslint"].setup({ on_attach = on_attach_custom })
lspconfig["marksman"].setup({ on_attach = on_attach_custom })
lspconfig["prismals"].setup({ on_attach = on_attach_custom })
lspconfig["jsonls"].setup({ on_attach = on_attach_custom })
lspconfig["cssls"].setup({ on_attach = on_attach_custom })
lspconfig["html"].setup({ on_attach = on_attach_custom })

lspconfig["lua_ls"].setup(vim.tbl_deep_extend("force", {
	on_attach = function(client, bufnr)
		on_attach_custom(client, bufnr)
		client.server_capabilities.completionProvider.triggerCharacters = { ".", ":" }
	end,
}, require("plugins.lsp.settings.lua_ls")))

lspconfig["pyright"].setup(vim.tbl_deep_extend("force", {
	on_attach = on_attach_custom,
}, require("plugins.lsp.settings.pyright")))

lspconfig["tailwindcss"].setup(vim.tbl_deep_extend("force", {
	on_attach = on_attach_custom,
}, require("plugins.lsp.settings.tailwindcss")))

typescript.setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	server = { on_attach = on_attach_custom },
})
