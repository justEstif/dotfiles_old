local status, base16 = pcall(require, "mini.base16")
if not status then
	print("mini.base16 error")
	return
end

local themes = {
	dark = base16.mini_palette("#0A2A2A", "#D0D0D0", 50),
	light = base16.mini_palette("#C0D2D2", "#262626", 80),
}

local theme = os.getenv("theme") or "dark"

base16.setup({
	palette = themes[theme],
	use_cterm = true,
	plugins = {
		default = true,
	},
})
