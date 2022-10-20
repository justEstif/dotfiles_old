-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

local nightfox_ok, nightfox = pcall(require, "nightfox")
if not nightfox_ok then
	return
end

nightfox.setup({
	options = {
		styles = {
			comments = "italic",
			keywords = "bold",
			types = "italic,bold",
		},
	},
})

vim.cmd("colorscheme nordfox")
