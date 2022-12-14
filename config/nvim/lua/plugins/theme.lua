local status, theme = pcall(require, "onedark")
if not status then
	print("onedark error")
	return
end

theme.setup({
	style = "darker", -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
})

theme.load()
