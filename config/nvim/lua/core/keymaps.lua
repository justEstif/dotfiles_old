local map = require("core.utils").map
require("core.utils").disable_keys() -- disable some keys

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

-- Utils
map("n", "<leader>r", [[:lua require("core.utils").run_file()<cr>]], { desc = "run current file" })

-- Mind
map("n", "<leader>om", ":MindOpenProject<cr>", { desc = "open mind project" })
map("n", "<leader>cm", ":MindClose<cr>", { desc = "close mind project" })

-- Telescope
map("n", "<leader>b", ":Telescope buffers<cr>", { desc = "List open buffers" })
map("n", "<leader>s", ":Telescope live_grep<CR>", { desc = "Search in cwd" })
map("n", "<leader><leader>", ":Telescope find_files<CR>", { desc = "Find files in cwd" })
map("n", "z=", ":Telescope spell_suggest<CR>", { desc = "Spell suggest keybind" })

map("n", "<leader>f", ":NvimTreeToggle<CR>", { desc = "Open Nvim tree" })
map("n", "<leader>g", ":G<cr>", { desc = "Open fugitive" })
