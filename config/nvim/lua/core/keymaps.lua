local map = require("core.utils").map
local run_file = require("core.utils").run_file
local smart_qq = require("core.utils").smart_qq

vim.g.mapleader = ","

map("v", "p", [["_dP]], { desc = "Keep the yanked text when pasting in visual  mode" })
map("x", "@", [[":norm @" . getcharstr() . "<cr>"]], { expr = true, desc = "Apply macro on visual range" })

map("n", "<leader>rr", run_file)
map("n", "<C-q>", smart_qq)

map("n", "<leader>f", ":lua MiniFiles.open()<CR>")

map("n", "<C-p>", ":Telescope find_files<cr>")
map("n", "<C-\\>", ":Telescope live_grep<cr>")
map("n", "<F1>", ":Telescope help_tags<cr>")
map("n", "z=", ":Telescope spell_suggest<cr>")
