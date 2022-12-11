local status, jump = pcall(require, "mini.jump")
if not status then
	print("mini.jump error")
	return
end

jump.setup()
