local status, toggleterm = pcall(require, "toggleterm")
if not status then
	print("toogleterm error")
	return
end

toggleterm.setup({
	direction = "float",
	open_mapping = "<leader>t",
	insert_mappings = false, -- open_mapping off in insert mode
})

local buf_map = require("core.utils").buf_map
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*",
	desc = "use esc to go to normal mode from term mode",
	callback = function()
		buf_map("t", "<esc>", [[<C-\><C-n>]])
	end,
})
