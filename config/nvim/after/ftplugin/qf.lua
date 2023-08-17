local buf_map = require("core.utils").buf_map

buf_map("n", "<cr>", ":.cc<cr>", { desc = "open file under cursor" })
buf_map("n", "dd", [[<Cmd>call setqflist(filter(getqflist(), {idx -> idx != line('.') - 1}), 'r') <Bar> cc<CR>]], { desc = "delete line" })
