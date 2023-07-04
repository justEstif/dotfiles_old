local status, base16 = pcall(require, "mini.base16")
if not status then
	print("mini.base16 error")
	return
end

local palette_light = {
	base00 = "#fbf1c7",
	base01 = "#ebdbb2",
	base02 = "#d5c4a1",
	base03 = "#bdae93",
	base04 = "#665c54",
	base05 = "#504945",
	base06 = "#3c3836",
	base07 = "#282828",
	base08 = "#9d0006",
	base09 = "#af3a03",
	base0A = "#b57614",
	base0B = "#79740e",
	base0C = "#427b58",
	base0D = "#076678",
	base0E = "#8f3f71",
	base0F = "#d65d0e",
}

local palette_dark = {
	base00 = "#282828",
	base01 = "#3c3836",
	base02 = "#504945",
	base03 = "#665c54",
	base04 = "#bdae93",
	base05 = "#d5c4a1",
	base06 = "#ebdbb2",
	base07 = "#fbf1c7",
	base08 = "#fb4934",
	base09 = "#fe8019",
	base0A = "#fabd2f",
	base0B = "#b8bb26",
	base0C = "#8ec07c",
	base0D = "#83a598",
	base0E = "#d3869b",
	base0F = "#d65d0e",
}

base16.setup({
	palette = palette_light,
	use_cterm = true,
})

vim.g.colors_name = "base16-github"
