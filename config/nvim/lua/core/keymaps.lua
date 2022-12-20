local map = require("core.utils").map

local disable_keys = {
	"<up>",
	"<left>",
	"<down>",
	"<right>",
	"gh",
	"gl",
	"gJ",
	"gL",
	",",
	" ",
	"K",
	"g/",
	"<bs>",
	";",
}

for _, disable_key in pairs(disable_keys) do
	map("", disable_key, "<nop>")
end

vim.g.mapleader = ","
-- g<Tab> -> tabedit current buffer
-- Override default
map("v", "p", [["_dP]], { desc = "Keep the yanked text when pasting in visual  mode" })
map("n", ">", ">>", { desc = "Indent" })
map("n", "<", "<<", { desc = "Indent" })
map("v", "<", "<gv", { desc = "Indent" })
map("v", ">", ">gv", { desc = "Indent" })
map("x", "@", [[":norm @" . getcharstr() . "<cr>"]], { expr = true, desc = "Appy macro on visual range" })
map("n", "<Esc>", function()
	require("mini.jump").stop_jumping()
	vim.cmd.nohlsearch()
	vim.cmd.echo()
end, { desc = "clear highlights" })

-- Utils
map("n", "gx", [[:lua require("core.utils").go_to_url()<cr>]], { desc = "go to url under cursor" })
map("n", "<leader>r", [[:lua require("core.utils").run_file()<cr>]], { desc = "run current file" })

-- Plugin shortcuts
map("n", "<leader>b", ":Telescope buffers<cr>", { desc = "List open buffers" })
map("n", "<leader>f", ":NvimTreeToggle<CR>", { desc = "Open Nvim tree" })
map("n", "<leader>g", ":G<cr>", { desc = "Open fugitive" })
map("n", "<leader>q", ":lua MiniBufremove.delete()<cr>", { desc = "close buffer" })
map("n", "<leader>s", ":Telescope live_grep<CR>", { desc = "Search in cwd" })
map("n", "<leader><leader>", ":Telescope find_files<CR>", { desc = "Find files in cwd" })
map("n", "z=", ":Telescope spell_suggest<CR>", { desc = "Spell suggest keybind" })
