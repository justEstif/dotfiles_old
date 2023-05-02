local status, cmp = pcall(require, "mini.completion")
if not status then
	print("mini.completion error")
	return
end

cmp.setup()
