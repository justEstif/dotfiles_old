local M = {}

local map = require("core.utils").map
local buf_map = require("core.utils").buf_map

vim.g.mapleader = ","

-- Override default
map("v", "p", [["_dP]], { desc = "Keep the yanked text when pasting in visual  mode" })
map("x", "@", [[":norm @" . getcharstr() . "<cr>"]], { expr = true, desc = "Apply macro on visual range" })
map("n", "<C-l>", function()
	require("mini.jump").stop_jumping()
	vim.cmd.nohlsearch()
	vim.cmd.echo()
end, { desc = "clear highlights" })

map("n", "<leader>g", ":G<cr>", { desc = "open fugitive" })
map("n", "<leader>l", ":Lazy<cr>", { desc = "open lazy plugin manager" })

M.lsp_keymaps = function()
	vim.bo.tagfunc = "v:lua.vim.lsp.tagfunc" -- use Ctrl-] to go to definition
	buf_map("n", "gh", ":lua vim.lsp.buf.hover()<CR>")
	buf_map("n", "gl", ":lua vim.diagnostic.open_float()<CR>")
	buf_map("n", "=", ":lua vim.lsp.buf.format{async=true}<CR>")
	buf_map("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>")
	buf_map("n", "<F3>", ":lua vim.lsp.buf.code_action()<CR>")
	buf_map("n", "<F8>", ":lua vim.diagnostic.goto_next({buffer=0})<cr>")
	buf_map("n", "<F11>", ":lua vim.lsp.buf.type_definition()<cr>")
	buf_map("n", "<F12>", ":lua vim.lsp.buf.references()<cr>")
end

return M
