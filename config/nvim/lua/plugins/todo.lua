local status, todo = pcall(require, "todo-comments")
if not status then
	print("todo comments error")
	return
end

todo.setup({
	keywords = {
		FIX = { alt = { "fix" }, icon = " ", color = "error" },
		TODO = { alt = { "todo" }, icon = " ", color = "info" },
		HACK = { alt = { "hack" }, icon = " ", color = "warning" },
		WARN = { alt = { "warn" }, icon = " ", color = "warning" },
		NOTE = { alt = { "note" }, icon = " ", color = "hint" },
		TEST = { alt = { "test" }, icon = "ﭧ ", color = "test" },
	},
})
