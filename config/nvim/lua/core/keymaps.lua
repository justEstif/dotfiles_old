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

-- Telescope shortcuts
map("n", "<leader>b", ":Telescope buffers<cr>", { desc = "List open buffers" })
map("n", "<leader>s", ":Telescope live_grep<CR>", { desc = "Search in cwd" })
map("n", "<leader><leader>", ":Telescope find_files<CR>", { desc = "Find files in cwd" })

-- Hop shortcuts
map("n", "H", ":HopVertical<cr>", { desc = "Jump by line" })
map("n", "s", ":HopChar2MW<cr>", { desc = "Jump using 2 letters" })

map("n", "<leader>f", ":NvimTreeToggle<CR>", { desc = "Open Nvim tree" })
map("n", "<leader>g", ":G<cr>", { desc = "Open fugitive" })
map("n", "<leader>q", ":%bdelete | lua MiniStarter.open()<CR>", { desc = "Close all buffers" })
