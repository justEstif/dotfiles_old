local status, cursorword = pcall(require, "mini.cursorword")
if not status then
	print("mini.cursorword error")
	return
end

cursorword.setup({})
