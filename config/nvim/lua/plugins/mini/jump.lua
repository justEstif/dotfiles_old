local status, jump = pcall(require, "mini.jump")
if not status then
	print("mini.jump error")
	return
end

jump.setup({
	mappings = {
		repeat_jump = "",
	},
})

local map = require("core.utils").map
map("n", "<C-l>", function()
	jump.stop_jumping()
	vim.cmd.nohlsearch()
	vim.cmd.echo()
end, { desc = "clear highlights" })
