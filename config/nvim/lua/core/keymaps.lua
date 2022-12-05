-- Keymaps
local map = require("core.utils").map

-- disable keys
local disable_keys = { "<up>", "<left>", "<down>", "<right>", "gh", "gl", "gL", ",", " " }
for _, disable_key in pairs(disable_keys) do
	map("", disable_key, "<nop>")
end

vim.g.mapleader = ","

-- Override default
map("v", "p", '"_dP', { desc = "Keep the yanked text when pasting in visual  mode" })
map("n", ">", ">>", { desc = "Indent" })
map("n", "<", "<<", { desc = "Indent" })
map("v", "<", "<gv", { desc = "Indent" })
map("v", ">", ">gv", { desc = "Indent" })
map("x", "@", '":norm @" . getcharstr() . "<cr>"', { expr = true, desc = "Appy macro on visual range" })
map("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })

-- Shortcuts
map("n", "<leader>q", ":%bdelete<CR>", { desc = "Close all buffers" })
map("n", "<leader>b", ":b <C-z>", { desc = "List open buffers" })

-- Lsp
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
map("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>")
map("n", "gr", "<cmd>Telescope lsp_references<CR>")
map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "gL", "<cmd>Telescope diagnostics<CR>")
map("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "gca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "=", "<cmd>lua vim.lsp.buf.format{async=true}<CR>")

-- Plugins shortcuts
map("n", "<leader>d", ":NvimTreeToggle<CR>", { desc = "Open Nvim tree" })
map("n", "<leader>g", ":tab G<cr>", { desc = "Fugitive: open" })
map("n", "<leader>f", ":Telescope find_files<CR>", { desc = "Telescope: find files" })
map("n", "<leader>s", ":Telescope live_grep<CR>", { desc = "Telescope: live grep" })
