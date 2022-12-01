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
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Esc exit terminal" })
map("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })

-- Shortcuts
map("n", "<leader>q", ":%bdelete<CR>", { desc = "Close all buffers" })
map("n", "<leader>b", ":b <C-z>", { desc = "List open buffers" })
map("n", "<leader>rr", ":so %<cr>", { desc = "Reload config" })
map("n", "<leader>t", function()
	require("core.utils").toggle_single_term()
end, { desc = "Toggle a single terminal" })

-- Plugins shortcuts
map("n", "<leader>d", ":NvimTreeToggle<CR>", { desc = "Open Nvim tree" })
map("n", "<leader>f", ":Telescope find_files<CR>", { desc = "Telescope: find files" })
map("n", "<leader>g", ":tab G<cr>", { desc = "Fugitive: open" })
map("n", "<leader>s", ":Telescope live_grep<CR>", { desc = "Telescope: live grep" })
