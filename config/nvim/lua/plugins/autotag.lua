local status, autotag = pcall(require, "nvim-ts-autotag")
if not status then
	print("nvim-ts-autotag error")
	return
end

autotag.setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 5,
		severity_limit = "Warning",
	},
	update_in_insert = true,
})
