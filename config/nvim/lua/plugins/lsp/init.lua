local on_attach_custom = function(client)
	vim.bo.tagfunc = "v:lua.vim.lsp.tagfunc" -- use Ctrl-] to go to definition
	vim.bo.omnifunc = "v:lua.MiniCompletion.completefunc_lsp"

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
	"tsserver",
	"lua_ls",
	"jsonls",
	"tailwindcss",
	"prismals",
	"marksman",
	"eslint",
	"svelte",
	"pyright",
	"solargraph",
	"gopls",
}

return { -- lsp
	"neovim/nvim-lspconfig", -- nvim native lsp
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	dependencies = {
		{
			"williamboman/mason.nvim", -- Installer for external tools
			cmd = {
				"Mason",
				"MasonInstall",
				"MasonUninstall",
				"MasonUninstallAll",
				"MasonLog",
			},
			config = true,
			dependencies = "williamboman/mason-lspconfig.nvim",
		},
		"williamboman/mason-lspconfig.nvim", -- mason extension for lspconfig
		opts = { ensure_installed = servers },
	},
	opts = { on_attach = on_attach_custom },
	config = function(_, opts)
		local lspconfig = require("lspconfig")

		lspconfig["svelte"].setup(opts)
		lspconfig["eslint"].setup(opts)
		lspconfig["marksman"].setup(opts)
		lspconfig["prismals"].setup(opts)
		lspconfig["jsonls"].setup(opts)
		lspconfig["html"].setup(opts)
		lspconfig["tailwindcss"].setup(opts)
		lspconfig["gopls"].setup(opts)
		lspconfig["tsserver"].setup(opts)

		lspconfig["cssls"].setup(vim.tbl_deep_extend("force", opts, require("plugins.lsp.settings.cssls")))

		lspconfig["solargraph"].setup(vim.tbl_deep_extend("force", {
			on_attach = function(client)
				on_attach_custom(client)
				client.server_capabilities.completionProvider.triggerCharacters = { ".", ":" }
			end,
		}, require("plugins.lsp.settings.solargraph")))

		lspconfig["lua_ls"].setup(vim.tbl_deep_extend("force", {
			on_attach = function(client)
				on_attach_custom(client)
				client.server_capabilities.completionProvider.triggerCharacters = { ".", ":" }
			end,
		}, require("plugins.lsp.settings.lua_ls")))

		lspconfig["pyright"].setup(vim.tbl_deep_extend("force", opts, require("plugins.lsp.settings.pyright")))
		lspconfig["denols"].setup(vim.tbl_deep_extend("force", opts, require("plugins.lsp.settings.denols")))
		lspconfig["tsserver"].setup(vim.tbl_deep_extend("force", opts, require("plugins.lsp.settings.tsserver")))
	end,
}
