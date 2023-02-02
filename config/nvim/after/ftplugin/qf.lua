local buf_map = require("core.utils").buf_map

buf_map("n", "<cr>", ":.cc<cr>", { desc = "open file under cursor" })
