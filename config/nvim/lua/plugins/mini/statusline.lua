-- Mini Statusline
local status, mini_statusline = pcall(require, "mini.statusline")
if not status then
	print("mini.statusline error")
	return
end

mini_statusline.setup({})
