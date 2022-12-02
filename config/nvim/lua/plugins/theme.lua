-- Theme
local status, theme = pcall(require, "onedark")
if not status then
	return
end

-- Lua
theme.setup({
	style = "darker", -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
})

theme.load()
