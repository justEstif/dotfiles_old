vim.opt_local.spell = true -- enable spell

require("mini.pairs").map_buf(0, "i", "*", { action = "closeopen", pair = "**" })
