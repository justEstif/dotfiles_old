local status, scope = pcall(require, "scope")
if not status then
	print("scope error")
	return
end

scope.setup()
