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
			header = "",
			prefix = "",
		},
	}
	vim.diagnostic.config(config)
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc") -- use Ctrl-] to go to definition
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", ":lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", ":lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "=", ":lua vim.lsp.buf.format{async=true}<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<F2>", ":lua require('plugins.lsp.rename').rename()<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<F3>", ":lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<F8>", ":lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<F11>", ":Telescope lsp_type_definitions<cr>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<F12>", ":Telescope lsp_references<cr>", opts)
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
