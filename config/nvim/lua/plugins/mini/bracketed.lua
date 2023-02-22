local status, bracketed = pcall(require, "mini.bracketed")
if not status then
	print("mini.bracketed error")
	return
end

bracketed.setup()
