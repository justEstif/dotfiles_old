local status, todo = pcall(require, "todo-comments")
if not status then
	print("todo comments error")
	return
end

todo.setup()
