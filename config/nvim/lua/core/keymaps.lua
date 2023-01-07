local map = require("core.utils").map

vim.g.mapleader = ","

-- Override default
map("v", "p", [["_dP]], { desc = "Keep the yanked text when pasting in visual  mode" })
map("n", ">", ">>", { desc = "Indent" })
map("n", "<", "<<", { desc = "Indent" })
map("v", "<", "<gv", { desc = "Indent" })
map("v", ">", ">gv", { desc = "Indent" })
map("x", "@", [[":norm @" . getcharstr() . "<cr>"]], { expr = true, desc = "Apply macro on visual range" })
map("n", "<C-l>", function()
	require("mini.jump").stop_jumping()
	vim.cmd.nohlsearch()
	vim.cmd.echo()
end, { desc = "clear highlights" })

map("n", "<leader>ot", ":tabnew<cr>", { desc = "open new tab" })
map("n", "<leader>ct", ":tabclose<cr>", { desc = "close tab" })
map("n", "<leader>cb", ":bd<cr>", { desc = "close buffer" })
map("n", "<leader>cv", ":qall<cr>", { desc = "close vim" })

map("n", "<leader>g", ":G<cr>", { desc = "Open fugitive" })
