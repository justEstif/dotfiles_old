local map = require("core.utils").map
local smart_qq = require("core.utils").smart_qq

vim.g.mapleader = ","

_G.ES.leader_group_clues = {
	{ mode = "n", keys = "<Leader>b", desc = "+Buffers" },
	{ mode = "n", keys = "<Leader>f", desc = "+Files" },
	{ mode = "n", keys = "<Leader>l", desc = "+Lsp" },
	{ mode = "n", keys = "<Leader>t", desc = "+Toggle" },
}

map("v", "p", [["_dP]], { desc = "Keep the yanked text when pasting in visual  mode" })
map("x", "@", [["<Cmd>norm @" . getcharstr() . "<cr>"]], { expr = true, desc = "Apply macro on visual range" })

-- buffers
map("n", "<leader>bb", [[<Cmd>Telescope buffers<CR>]], { desc = "Buffers" })
map("n", "<leader>bd", smart_qq, { desc = "Delete" })

-- files
map("n", "<leader>fd", "<Cmd>lua MiniFiles.open()<CR>", { desc = "Directory" })
map("n", "<leader>ff", "<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", { desc = "File" })

-- telescope
map("n", [[<C-\>]], "<Cmd>Telescope live_grep<cr>", { desc = "Telescope: live grep" })
map("n", "<C-p>", "<Cmd>Telescope find_files<cr>", { desc = "Telescope: find files" })
map("n", "<F1>", "<Cmd>Telescope help_tags<cr>", { desc = "help" })
map("n", "z=", "<Cmd>Telescope spell_suggest<cr>", { desc = "spell suggest" })

-- lsp
map("n", "<leader>la", [[<Cmd>lua vim.lsp.buf.signature_help()<CR>]], { desc = "Arguments popup" })
map("n", "<leader>ld", [[<Cmd>lua vim.diagnostic.open_float()<CR>]], { desc = "Diagnostics popup" })
map("n", "<leader>lf", [[<Cmd>lua vim.lsp.buf.format{async=true}<CR>]], { desc = "Format" })
map("n", "<leader>li", [[<Cmd>lua vim.lsp.buf.hover()<CR>]], { desc = "Information" })
map("n", "<leader>lr", [[<Cmd>lua vim.lsp.buf.rename()<CR>]], { desc = "Rename" })
map("n", "<leader>lR", [[<Cmd>lua vim.lsp.buf.references()<CR>]], { desc = "References" })
map("n", "<leader>ls", [[<Cmd>lua vim.lsp.buf.definition()<CR>]], { desc = "Source definition" })
