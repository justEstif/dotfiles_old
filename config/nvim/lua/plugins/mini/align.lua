local status, align = pcall(require, "mini.align")
if not status then
	print("mini.align error")
	return
end

align.setup({})
