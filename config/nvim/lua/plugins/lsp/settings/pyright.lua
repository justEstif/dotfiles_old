local util = require("lspconfig").util
return {
	flags = { debounce_text_changes = 150 },
	root_dir = util.root_pattern(".venv", "venv", "pyrightconfig.json"),
	settings = {
		pyright = { disableLanguageServices = false, disableOrganizeImports = true },
		python = {
			analysis = {
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
			},
		},
	},
}
