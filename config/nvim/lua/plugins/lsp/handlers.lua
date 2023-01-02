local M = {}

M.setup = function()
	local config = {
		virtual_text = false,
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc") -- use Ctrl-] to go to definition
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", ":lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", ":lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "=", ":lua vim.lsp.buf.format{async=true}<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<F2>", ":lua require('plugins.lsp.rename').rename()<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<F3>", ":lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<F8>", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<F11>", ":Telescope lsp_type_definitions<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<F12>", ":Telescope lsp_references<cr>", opts)
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.MiniCompletion.completefunc_lsp")

	require("vim.lsp.protocol").CompletionItemKind[1] = ""
	require("vim.lsp.protocol").CompletionItemKind[2] = ""
	require("vim.lsp.protocol").CompletionItemKind[3] = ""
	require("vim.lsp.protocol").CompletionItemKind[4] = ""
	require("vim.lsp.protocol").CompletionItemKind[5] = "ﰠ"
	require("vim.lsp.protocol").CompletionItemKind[6] = ""
	require("vim.lsp.protocol").CompletionItemKind[7] = "ﴯ"
	require("vim.lsp.protocol").CompletionItemKind[8] = ""
	require("vim.lsp.protocol").CompletionItemKind[9] = ""
	require("vim.lsp.protocol").CompletionItemKind[10] = "ﰠ"
	require("vim.lsp.protocol").CompletionItemKind[11] = "塞"
	require("vim.lsp.protocol").CompletionItemKind[12] = ""
	require("vim.lsp.protocol").CompletionItemKind[13] = ""
	require("vim.lsp.protocol").CompletionItemKind[14] = ""
	require("vim.lsp.protocol").CompletionItemKind[15] = ""
	require("vim.lsp.protocol").CompletionItemKind[16] = ""
	require("vim.lsp.protocol").CompletionItemKind[17] = ""
	require("vim.lsp.protocol").CompletionItemKind[18] = ""
	require("vim.lsp.protocol").CompletionItemKind[19] = ""
	require("vim.lsp.protocol").CompletionItemKind[20] = ""
	require("vim.lsp.protocol").CompletionItemKind[21] = ""
	require("vim.lsp.protocol").CompletionItemKind[22] = "פּ"
	require("vim.lsp.protocol").CompletionItemKind[23] = ""
	require("vim.lsp.protocol").CompletionItemKind[24] = ""
	require("vim.lsp.protocol").CompletionItemKind[25] = "𝙏"

	-- use null-ls for these languages
	local ignored_formatters = { "tsserver", "sumneko_lua", "html" }
	for _, value in ipairs(ignored_formatters) do
		if value == client.name then
			client.server_capabilities.document_formatting = false
		end
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

return M
