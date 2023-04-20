local map = require("core.utils").map
local run_file = require("core.utils").run_file
local smart_qq = require("core.utils").smart_qq

vim.g.mapleader = ","

map("v", "p", [["_dP]], { desc = "Keep the yanked text when pasting in visual  mode" })
map("x", "@", [[":norm @" . getcharstr() . "<cr>"]], { expr = true, desc = "Apply macro on visual range" })

map("n", "<F5>", ":buffers<CR>:buffer<Space>", {
	desc = "switch buffers",
})

map("n", "<leader>rr", function()
	run_file()
end)

map("n", "<C-q>", function()
	smart_qq()
end, { desc = "close buffer or quit neovim" })

map("n", "<leader>f", ":NvimTreeToggle<CR>")

-- Fzf
map("n", "<C-k>", ":FzfLua commands<cr>", { desc = "fzflua buffers" })
map("n", "<C-p>", ":FzfLua files<cr>", { desc = "fzflua buffers" })
map("n", "<C-\\>", ":FzfLua live_grep<cr>", { desc = "fzflua buffers" })
map("n", "<F1>", ":FzfLua help_tags<cr>", { desc = "fzflua buffers" })
map("n", "z=", ":FzfLua spell_suggest<CR>", { desc = "Spell suggest keybind" })
