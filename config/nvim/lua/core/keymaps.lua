local map = require("core.utils").map

vim.g.mapleader = ","

-- Override default
map("v", "p", [["_dP]], { desc = "Keep the yanked text when pasting in visual  mode" })
map("x", "@", [[":norm @" . getcharstr() . "<cr>"]], { expr = true, desc = "Apply macro on visual range" })
map("n", "<C-l>", function()
	require("mini.jump").stop_jumping()
	vim.cmd.nohlsearch()
	vim.cmd.echo()
end, { desc = "clear highlights" })

-- tabs
map("n", "<leader>tt", ":tabnew<cr>", { desc = "open new tab" })

map("n", "<leader>g", ":G<cr>", { desc = "open fugitive" })
map("n", "<leader>l", ":Lazy<cr>", { desc = "open lazy plugin manager" })
