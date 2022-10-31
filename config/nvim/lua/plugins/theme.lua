-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------
local status, onedark = pcall(require, "onedark")
if not status then
	return
end

onedark.setup({
	style = "darker", -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
	ending_tildes = true,
	code_style = {
		comments = "none",
	},
})

onedark.load()
