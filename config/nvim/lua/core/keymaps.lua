local map = require("core.utils").map
local run_file = require("core.utils").run_file
local smart_qq = require("core.utils").smart_qq

vim.g.mapleader = ","

map("v", "p", [["_dP]], { desc = "Keep the yanked text when pasting in visual  mode" })
map("x", "@", [[":norm @" . getcharstr() . "<cr>"]], { expr = true, desc = "Apply macro on visual range" })

map("n", "<leader>rr", run_file)
map("n", "<C-q>", smart_qq)

map("n", "<leader>f", ":NvimTreeToggle<CR>")

-- Fzf
map("n", "<C-k>", ":FzfLua commands<cr>", { desc = "fzflua commands" })
map("n", "<C-p>", ":FzfLua files<cr>", { desc = "fzflua files" })
map("n", "<C-\\>", ":FzfLua live_grep<cr>", { desc = "fzflua grep" })
map("n", "z=", ":FzfLua spell_suggest<CR>", { desc = "fzflua spell suggest" })
