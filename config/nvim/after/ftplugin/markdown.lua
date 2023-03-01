vim.opt_local.spell = true -- enable spell check
vim.opt_local.wrap = true
vim.opt_local.linebreak = true -- break at words
vim.opt_local.iskeyword:remove("-") -- don't treat dash separated words as 1 word

local buf_map = require("core.utils").buf_map

buf_map("n", "j", "gj", { desc = "move down wrapped lines" })
buf_map("n", "k", "gk", { desc = "move up wrapped lines" })

buf_map("n", "<leader>rr", function()
	local cmd = string.format('TermExec cmd="%s"<cr>', "glow %:p")
	vim.cmd(cmd)
	buf_map({ "n", "t" }, "q", "<cmd>close<cr>")
end, { desc = "preview file using glow" })
