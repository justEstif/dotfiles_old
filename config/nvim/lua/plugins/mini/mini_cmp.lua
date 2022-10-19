-----------------------------------------------------------
-- Mini Completion configuration file
----------------------------------------------------------

local status_completion, mini_completion = pcall(require, "mini.completion")
if not status_completion then
	return
end

mini_completion.setup({
	source_func = "omnifunc",
	auto_setup = false,
})

local bind = function(lhs, rhs)
	vim.keymap.set("i", lhs, rhs, { noremap = true, expr = true })
end

bind("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
bind("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
