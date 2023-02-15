local status, toggleterm = pcall(require, "toggleterm")
if not status then
	print("toogleterm error")
	return
end

local buf_map = require("core.utils").buf_map
local map = require("core.utils").map

toggleterm.setup({
	direction = "float",
	open_mapping = "<leader>t",
	insert_mappings = false, -- open_mapping off in insert mode
	on_open = function()
		buf_map("t", "<esc>", [[<C-\><C-n>]])
		vim.b.miniindentscope_disable = true
	end,
})

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	on_open = function()
		vim.cmd("startinsert!")
		vim.b.miniindentscope_disable = true
		buf_map("n", "q", "<cmd>close<CR>")
	end,
})

map("n", "<leader>g", function()
	lazygit:toggle()
end)
