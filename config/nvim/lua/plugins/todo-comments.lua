-----------------------------------------------------------
-- Todo Comments configuration file
----------------------------------------------------------

local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
	return
end

-- HACK: Fix cmd line bug
local hl = require("todo-comments.highlight")
local highlight_win = hl.highlight_win
hl.highlight_win = function(win, force)
	pcall(highlight_win, win, force)
end

todo_comments.setup({
	highlight = {
		keyword = "wide", -- "fg", "bg", "wide" or empty.
	},
	keywords = {
		IDEA = { icon = "", color = "hint" },
		QUESTION = { icon = "", color = "hint" },
	},
})
