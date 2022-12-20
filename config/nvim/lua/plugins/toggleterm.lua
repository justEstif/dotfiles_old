local status, toggleterm = pcall(require, "toggleterm")
if not status then
	print("toogleterm error")
	return
end

toggleterm.setup({
	size = 18,
	shade_terminals = false,
	direction = "horizontal",
	persist_size = true,
	open_mapping = "<leader>t",
	insert_mappings = false, -- open_mapping off in insert mode
})

local term_buf_map = function(lhs, rhs)
	require("core.utils").buf_map("t", lhs, rhs)
end

-- set keymap
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*",
	callback = function()
		term_buf_map("<esc>", [[<C-\><C-n>]])
	end,
})
