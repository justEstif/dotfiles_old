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

local augroup = require("core.utils").augroup
local aucmd = require("core.utils").aucmd
local buf_map = require("core.utils").buf_map

augroup("EscapeTermKeymap", function(g)
	aucmd("TermOpen", {
		group = g,
		pattern = "term://*",
		callback = function()
			buf_map("t", "<esc>", [[<C-\><C-n>]])
		end,
	})
end)
