local M = {}

require("core.fixfnkeys")

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

map("n", "]b", ":bnext<CR>", { desc = "navigate buffers" })
map("n", "[b", ":bprevious<CR>", { desc = "navigate buffers" })
map("n", "<leader>cd", ":tcd %:p:h<cr>", { desc = "change cwd" })

map("n", "<leader>f", ":NvimTreeToggle<CR>")

map("n", "<F1>", ":Telescope help_tags<cr>", { desc = "help tags" })
map("n", "<leader>b", ":Telescope buffers<cr>", { desc = "List open buffers" })
map("n", "<leader>s", ":Telescope live_grep<CR>", { desc = "Search in cwd" })
map("n", "<leader><leader>", ":Telescope find_files<CR>", { desc = "Find files in cwd" })
map("n", "z=", ":Telescope spell_suggest<CR>", { desc = "Spell suggest keybind" })

map({ "i", "s" }, "<C-l>", function()
	require("luasnip").jump(1)
end, { desc = "jump in snippet" })
map({ "i", "s" }, "<C-h>", function()
	require("luasnip").jump(-1)
end, { desc = "jump in snippet" })

M.lsp_keymaps = function()
	vim.bo.tagfunc = "v:lua.vim.lsp.tagfunc" -- use Ctrl-] to go to definition
	buf_map("n", "gh", ":lua vim.lsp.buf.hover()<CR>")
	buf_map("n", "gl", ":lua vim.diagnostic.open_float()<CR>")
	buf_map("n", "gr", ":Telescope lsp_references<cr>")
	buf_map("n", "gT", ":lua vim.lsp.buf.type_definition()<cr>")
	buf_map("n", "=", ":lua vim.lsp.buf.format{async=true}<CR>")
	buf_map("n", "]d", ":lua vim.diagnostic.goto_next({buffer=0})<cr>")
	buf_map("n", "[d", ":lua vim.diagnostic.goto_next({buffer=0})<cr>")
	buf_map("n", "<F2>", ":lua vim.lsp.buf.rename()<CR>")
	buf_map("n", "<F14>", ":lua vim.lsp.buf.code_action()<CR>")
end

return M
