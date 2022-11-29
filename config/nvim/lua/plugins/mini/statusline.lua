-- Mini Statusline
local status_statusline, mini_statusline = pcall(require, "mini.statusline")
if not status_statusline then
	print("mini.statusline error")
	return
end

mini_statusline.setup({})
