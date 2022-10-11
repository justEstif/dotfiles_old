-----------------------------------------------------------
-- Mini Completion configuration file
----------------------------------------------------------

local status_completion, mini_completion = pcall(require, "mini.completion")
if not status_completion then
	return
end

mini_completion.setup({
	source_func = "omnifunc",
	auto_setup = true,
})

local map = require("utils.map")
map("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
map("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
