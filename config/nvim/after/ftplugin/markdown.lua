vim.opt_local.spell = true -- enable spell check
vim.opt_local.wrap = true
vim.opt_local.linebreak = true -- break at words
vim.opt_local.joinspaces = true -- autoinsert two spaces after '.', '?', '!' for join command.

vim.b.miniindentscope_disable = true

local buf_map = require("core.utils").buf_map

buf_map("n", "j", "gj", { desc = "next line" })
buf_map("n", "k", "gk", { desc = "prev line" })
