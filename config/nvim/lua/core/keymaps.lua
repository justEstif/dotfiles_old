 local map = require("core.utils").map
local smart_qq = require("core.utils").smart_qq

vim.g.mapleader = ","

_G.ES.leader_group_clues = {
	{ mode = "n", keys = "<Leader>b", desc = "+Buffers" },
	{ mode = "n", keys = "<Leader>f", desc = "+Files" },
	{ mode = "n", keys = "<Leader>l", desc = "+Lsp" },
	{ mode = "n", keys = "<Leader>o", desc = "+Obsidian" },
	{ mode = "n", keys = "<Leader>t", desc = "+Toggle" },
}

-- use 'cl' instead of 's'
map("n", [[s]], [[<Nop>]])
map("x", [[s]], [[<Nop>]])

map("v", "p", [["_dP]], { desc = "Keep the yanked text when pasting in visual  mode" })
map("x", "@", [["<Cmd>norm @" . getcharstr() . "<cr>"]], { expr = true, desc = "Apply macro on visual range" })

-- buffers
map("n", "<leader>bb", [[<Cmd>FzfLua buffers<CR>]], { desc = "Buffers" })
map("n", "<leader>bd", smart_qq, { desc = "Delete" })

-- files
map("n", "<leader>fd", "<Cmd>lua MiniFiles.open()<CR>", { desc = "Directory" })
map("n", "<leader>ff", "<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", { desc = "File" })

-- fzf
map("n", [[<C-\>]], "<Cmd>FzfLua live_grep<cr>", { desc = "live grep" })
map("n", "<C-p>", "<Cmd>FzfLua files<cr>", { desc = "find files" })
map("n", "<F1>", "<Cmd>FzfLua help_tags<cr>", { desc = "help" })
map("n", "z=", "<Cmd>FzfLua spell_suggest<cr>", { desc = "spell suggest" })
map("n", "<C-k>", [[<Cmd>FzfLua commands<CR>]], { desc = "Nvim Commands" })

-- lsp
map("n", "<leader>la", [[<Cmd>lua vim.lsp.buf.signature_help()<CR>]], { desc = "Arguments popup" })
map("n", "<leader>ld", [[<Cmd>lua vim.diagnostic.open_float()<CR>]], { desc = "Diagnostics popup" })
map("n", "<leader>li", [[<Cmd>lua vim.lsp.buf.hover()<CR>]], { desc = "Information" })
map("n", "<leader>lr", [[<Cmd>lua vim.lsp.buf.rename()<CR>]], { desc = "Rename" })
map("n", "<leader>lR", [[<Cmd>lua vim.lsp.buf.references()<CR>]], { desc = "References" })
map("n", "<leader>ls", [[<Cmd>lua vim.lsp.buf.definition()<CR>]], { desc = "Source definition" })
