local map = require("core.utils").map
local smart_qq = require("core.utils").smart_qq

vim.g.mapleader = ","

_G.ES.leader_group_clues = {
	{ mode = "n", keys = "<Leader>b", desc = "+Buffers" },
	{ mode = "n", keys = "<Leader>f", desc = "+Files" },
	{ mode = "n", keys = "<Leader>o", desc = "+Other" },
	{ mode = "n", keys = "<Leader>t", desc = "+Toggle" },
	{ mode = "n", keys = "<Leader>z", desc = "+Zen" },
}

map("v", "p", [["_dP]], { desc = "Keep the yanked text when pasting in visual  mode" })
map("x", "@", [[":norm @" . getcharstr() . "<cr>"]], { expr = true, desc = "Apply macro on visual range" })

-- buffers
map("n", "<leader>bd", smart_qq, { desc = "Delete" })

-- files
map("n", "<leader>fd", ":lua MiniFiles.open()<CR>", { desc = "Directory" })
map("n", "<leader>ff", ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", { desc = "File" })

-- telescope
map("n", "<C-p>", ":Telescope find_files<cr>", { desc = "Telescope: find files" })
map("n", "<C-k>", ":Telescope commands<cr>", { desc = "Telescope: commands" })
map("n", "<C-\\>", ":Telescope live_grep<cr>", { desc = "Telescope: live grep" })
map("n", "<F1>", ":Telescope help_tags<cr>", { desc = "help" })
map("n", "z=", ":Telescope spell_suggest<cr>", { desc = "spell suggest" })

-- zen
map("n", "<leader>zn", ":TZNarrow<CR>", { desc = "narrow" })
map("v", "<leader>zn", ":'<,'>TZNarrow<CR>", { desc = "narrow" })
map("n", "<leader>zf", ":TZFocus<CR>", { desc = "focus" })
map("n", "<leader>zm", ":TZMinimalist<CR>", { desc = "minimalist" })
map("n", "<leader>za", ":TZAtaraxis<CR>", { desc = "zen" })

-- other
map("n", "<leader>ot", "<cmd>TWValues<cr>", { desc = "TW CSS values" })

-- custom commands
vim.api.nvim_create_user_command(
	"Timestamp",
	[[:put =strftime('%Y%m%d%H%M%S') | :norm kJ]],
	{ desc = "Timestamp and paste in line below" }
)
vim.api.nvim_create_user_command(
	"RandomString",
	[[!openssl rand -hex 32 | xsel -ib]],
	{ desc = "Generate random string and store into registry" }
)
vim.api.nvim_create_user_command("ClearRegister", function()
	local regs = vim.fn.split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"*', "\\zs")
	for _, r in ipairs(regs) do
		vim.fn.setreg(r, {})
	end
end, { desc = "Clear all registers" })
