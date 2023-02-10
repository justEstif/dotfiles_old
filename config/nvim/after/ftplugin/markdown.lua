vim.opt_local.spell = true -- enable spell check
vim.opt_local.wrap = true

local buf_map = require("core.utils").buf_map
local run_file = require("core.utils").run_file

buf_map("n", "j", "gj", { desc = "move down wrapped lines" })
buf_map("n", "k", "gk", { desc = "move up wrapped lines" })

buf_map("n", "<leader>rr", function()
	run_file()
end, { desc = "preview file using glow" })
