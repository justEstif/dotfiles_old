local status, statusline = pcall(require, "mini.statusline")
if not status then
	print("mini.statusline error")
	return
end

statusline.setup({})
