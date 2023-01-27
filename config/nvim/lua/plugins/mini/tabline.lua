local status, tabline = pcall(require, "mini.tabline")
if not status then
	print("mini.tabline error")
	return
end

tabline.setup({})
