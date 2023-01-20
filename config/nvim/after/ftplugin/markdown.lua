vim.opt_local.spell = true -- enable spell check

local buf_map = require("core.utils").buf_map
local run_file = require("core.utils").run_file

buf_map("n", "<leader>rr", function()
	run_file()
	buf_map({ "n", "t" }, "q", "<cmd>close<cr>")
end, { desc = "preview file using glow" })
