local buf_map = require("core.utils").buf_map

buf_map("n", "<cr>", ":.cc<cr>", { desc = "Open file under cursor" })
