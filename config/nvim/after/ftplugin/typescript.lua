local buf_map = require("core.utils").buf_map

buf_map("n", "<leader>r", [[:TermExec cmd="ts-node %" <cr>]], { desc = "Run file" })
