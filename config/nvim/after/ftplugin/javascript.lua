local buf_map = require("core.utils").buf_map

buf_map("n", "<leader>rr", function()
	local cmd = string.format('TermExec cmd="%s"<cr>', "node %")
	vim.cmd(cmd)
	buf_map({ "n", "t" }, "q", "<cmd>close<cr>")
end, { desc = "run file using node" })
