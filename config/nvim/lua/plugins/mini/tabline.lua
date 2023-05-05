local status, tabline = pcall(require, "mini.tabline")
if not status then
	print("mini.split-join error")
	return
end

tabline.setup({
	show_icons = false,
})
