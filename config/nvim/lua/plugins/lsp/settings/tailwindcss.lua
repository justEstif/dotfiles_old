return {
	filetypes = { "html", "css", "javascript", "javascriptreact", "typescriptreact" },
	settings = {
		tailwindCSS = {
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning",
			},
			experimental = {
				classRegex = {
					'class="([^"]*)',
					"cva\\(([^)]*)\\)",
					"[\"'`]([^\"'`]*).*?[\"'`]",
				},
			},
			validate = true,
		},
	},
}
