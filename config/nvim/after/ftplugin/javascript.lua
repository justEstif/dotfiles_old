vim.opt_local.spell = true -- enable spell check

local buf_map = require("core.utils").buf_map
local run_file = require("core.utils").run_file

buf_map("n", "<leader>rr", function()
	run_file()
end, { desc = "run file using node" })
