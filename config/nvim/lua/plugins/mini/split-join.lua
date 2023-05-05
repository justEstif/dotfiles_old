local status, split_join = pcall(require, "mini.splitjoin")
if not status then
	print("mini.split-join error")
	return
end

split_join.setup({})
