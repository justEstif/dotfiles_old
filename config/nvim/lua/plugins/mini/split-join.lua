local status, splitjoin = pcall(require, "mini.splitjoin")
if not status then
	print("mini.splitjoin error")
	return
end

splitjoin.setup()
