local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	return
end

local nvim_tree_config = require("nvim-tree.config")
local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	filters = { custom = { "^.git$" } },
	diagnostics = {
		enable = true,
		icons = {
			hint = "H",
			info = "I",
			warning = "W",
			error = "E",
		},
	},
	view = {
		width = 27,
		mappings = {
			list = {
				{ key = { "l", "<CR>" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
			},
		},
	},
})
