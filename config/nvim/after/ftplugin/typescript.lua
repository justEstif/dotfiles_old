local buf_map = require("core.utils").buf_map

buf_map("n", "<leader>r", function()
	local file_name = vim.fn.expand("%:p")
	local cmd = string.format('TermExec cmd="ts-node %s"<cr>', file_name)
	vim.cmd(cmd)
end, { desc = "Run file" })
