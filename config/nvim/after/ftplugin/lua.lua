local buf_map = require("core.utils").buf_map

buf_map("n", "<leader>R", ":so %<cr>", { desc = "Reload config" })
