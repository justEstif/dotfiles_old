local status, surround = pcall(require, "mini.surround")
if not status then
	print("mini.surround error")
	return
end

-- Replace vim-surround:
surround.setup({
	n_lines = 500,
	search_method = "cover_or_nearest",
})
