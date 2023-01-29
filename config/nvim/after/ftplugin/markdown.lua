vim.opt_local.spell = true -- enable spell check

local buf_map = require("core.utils").buf_map

buf_map("n", "<leader>rr", function()
	vim.cmd([[TermExec cmd="glow %:p"<cr>]])
	buf_map({ "n", "t" }, "q", "<cmd>close<cr>")
end, { desc = "preview file using glow" })
