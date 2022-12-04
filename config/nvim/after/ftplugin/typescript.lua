local buf_map = require("core.utils").buf_map

buf_map("n", "<leader>r", [[ :exec '!ts-node-transpile-only '.shellescape('%')<cr>]], { desc = "Run file" })
