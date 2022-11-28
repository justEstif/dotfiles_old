-- Mini ai
local status_ai, mini_ai = pcall(require, "mini.ai")
if not status_ai then
	print("mini.ai error")
	return
end

mini_ai.setup({
	search_method = "cover_or_nearest",
})

