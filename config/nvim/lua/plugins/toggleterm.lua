local status, toggleterm = pcall(require, "toggleterm")
if not status then
	print("toogleterm error")
	return
end

local buf_map = require("core.utils").buf_map

toggleterm.setup({
	direction = "float",
	open_mapping = "<leader>t",
	insert_mappings = false, -- open_mapping off in insert mode
	on_open = function()
		buf_map("t", "<esc>", [[<C-\><C-n>]])
		vim.b.miniindentscope_disable = true
	end,
})
