local buf_map = require("core.utils").buf_map

buf_map("n", "<leader>rr", ":so %<cr>", { desc = "Reload config" })
