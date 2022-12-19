local status, bufremove = pcall(require, "mini.bufremove")
if not status then
	print("mini.bufremove error")
	return
end

bufremove.setup({})
