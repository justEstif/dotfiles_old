local status, fuzzy = pcall(require, "mini.fuzzy")
if not status then
	print("mini.fuzzy error")
	return
end

fuzzy.setup()
