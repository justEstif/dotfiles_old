local buf_map = require("core.utils").buf_map

buf_map("n", "<leader><leader>", "<C-w>q", { desc = "quit fugitive" })
