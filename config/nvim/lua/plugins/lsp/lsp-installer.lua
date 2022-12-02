-----------------------------------------------------------
-- LSP-Installer configuration file
----------------------------------------------------------

local status_ok_mason, mason = pcall(require, "mason")
if not status_ok_mason then
	return
end

mason.setup({})

local status_ok_lsp_installer, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_lsp_installer then
	return
end

local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_ok_lspconfig then
	return
end

local status, typescript = pcall(require, "typescript")
if not status then
	return
end

local servers =
	{ "html", "cssls", "tsserver", "sumneko_lua", "jsonls", "tailwindcss", "prismals", "marksman", "eslint" }

mason_lspconfig.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("plugins.lsp.handlers").on_attach,
		capabilities = require("plugins.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]
	local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	if server == "tsserver" then -- uses the typescript plugin
		typescript.setup({
			disable_commands = false, -- prevent the plugin from creating Vim commands
			debug = false, -- enable debug logging for commands
			server = opts,
		})
	else
		lspconfig[server].setup(opts)
	end
end
