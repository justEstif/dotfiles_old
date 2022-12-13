vim.opt_local.spell = true -- enable spell
local buf_map = require("core.utils").buf_map
local go_to_url = require("core.utils").go_to_url

buf_map("n", "gx", function()
	go_to_url()
end, { desc = "go to url under cursor" })
