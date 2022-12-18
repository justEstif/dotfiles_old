local status, tabline = pcall(require, "mini.tabline")
if not status then
	print("mini.ai error")
	return
end

tabline.setup({})
