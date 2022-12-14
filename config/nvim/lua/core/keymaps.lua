local map = require("core.utils").map
local resize = require("core.utils").resize

local disable_keys = {
	"<up>",
	"<left>",
	"<down>",
	"<right>",
	"gh",
	"gl",
	"gL",
	",",
	" ",
	"K",
	"g/",
	"<cr>",
	"<bs>",
	";",
}

for _, disable_key in pairs(disable_keys) do
	map("", disable_key, "<nop>")
end

vim.g.mapleader = ","

-- Fix common typos
vim.cmd([[
    cnoreabbrev W! w!
    cnoreabbrev W1 w!
    cnoreabbrev w1 w!
    cnoreabbrev Q! q!
    cnoreabbrev Q1 q!
    cnoreabbrev q1 q!
    cnoreabbrev Qa! qa!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wa wa
    cnoreabbrev Wq wq
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev wq1 wq!
    cnoreabbrev Wq1 wq!
    cnoreabbrev wQ1 wq!
    cnoreabbrev WQ1 wq!
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qa qa
    cnoreabbrev Qall qall
]])

-- Override default
map("v", "p", '"_dP', { desc = "Keep the yanked text when pasting in visual  mode" })
map("n", ">", ">>", { desc = "Indent" })
map("n", "<", "<<", { desc = "Indent" })
map("v", "<", "<gv", { desc = "Indent" })
map("v", ">", ">gv", { desc = "Indent" })
map("x", "@", '":norm @" . getcharstr() . "<cr>"', { expr = true, desc = "Appy macro on visual range" })
map("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })

-- Keep matches center screen when cycling with n|N
map("n", "n", "nzzzv", { desc = "Fwd  search '/' or '?'" })
map("n", "N", "Nzzzv", { desc = "Back search '/' or '?'" })

-- Plugin shortcuts
map("n", "s", ":lua MiniJump2d.start(MiniJump2d.builtin_opts.query)<CR>", { desc = "Jump to query" })
map(
	"n",
	";",
	":lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<CR>",
	{ desc = "Jump to single character" }
)
map("n", "<leader>b", ":Telescope buffers<cr>", { desc = "List open buffers" })
map("n", "<leader>f", ":NvimTreeToggle<CR>", { desc = "Open Nvim tree" })
map("n", "<leader>g", ":G<cr>", { desc = "Open fugitive" })
map("n", "<leader>q", ":%bdelete | lua MiniStarter.open()<CR>", { desc = "Close all buffers" })
map("n", "<leader>s", ":Telescope live_grep<CR>", { desc = "Search in cwd" })
map("n", "<leader><leader>", ":Telescope find_files<CR>", { desc = "Find files in cwd" })

-- -- tmux like directional window resizes
map("n", "<up>", function()
	resize(false, -5)
end, { desc = "horizontal split increase" })
map("n", "<down>", function()
	resize(false, 5)
end, { desc = "horizontal split decrease" })
map("n", "<left>", function()
	resize(true, -5)
end, { desc = "vertical split decrease" })
map("n", "<right>", function()
	resize(true, 5)
end, { desc = "vertical split increase" })
