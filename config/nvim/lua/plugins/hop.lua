-- Mini ai
local status, hop = pcall(require, "hop")
if not status then
	print("hop error")
	return
end

hop.setup({})
