local map = require("core.utils").map

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

-- Override default
map("v", "p", '"_dP', { desc = "Keep the yanked text when pasting in visual  mode" })
map("n", ">", ">>", { desc = "Indent" })
map("n", "<", "<<", { desc = "Indent" })
map("v", "<", "<gv", { desc = "Indent" })
map("v", ">", ">gv", { desc = "Indent" })
map("x", "@", '":norm @" . getcharstr() . "<cr>"', { expr = true, desc = "Appy macro on visual range" })
map("n", "<Esc>", ":nohl | lua MiniJump.stop_jumping()<cr><CR>", { desc = "Clear search/jump highlights" })

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
