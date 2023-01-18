local status, move = pcall(require, "mini.move")
if not status then
	print("mini.move error")
	return
end

move.setup()
