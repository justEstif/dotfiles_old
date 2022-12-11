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

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":Telescope lsp_definitions<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", ":Telescope lsp_type_definitions<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":Telescope lsp_references<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", ":lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", ":lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gL", ":Telescope diagnostics<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gR", ":lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gca", ":lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "=", ":lua vim.lsp.buf.format{async=true}<CR>", opts)
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)

	-- use null-ls for these languages
	local ignored_formatters = { "tsserver", "sumneko_lua", "html" }
	for _, value in ipairs(ignored_formatters) do
		if value == client.name then
			client.server_capabilities.document_formatting = false
		end
	end
end

local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status then
	print("cmp_nvim_lsp error")
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

return M
