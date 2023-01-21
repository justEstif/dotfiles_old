vim.opt_local.spell = true -- enable spell check

local buf_map = require("core.utils").buf_map

buf_map("n", "<leader>rr", function()
	vim.cmd("vs | term glow %")
	buf_map({ "n", "t" }, "q", "<cmd>close<cr>")
	vim.api.nvim_create_autocmd("BufLeave", {
		buffer = 0,
		command = "bd",
		desc = "Close terminal buffer on process exit",
	})
end, { desc = "preview file using glow" })
