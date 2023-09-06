return {
	"catppuccin/nvim",
	as = "catppuccin",
	lazy = false,
	opts = {
		no_italic = true, -- Force no italic
		background = {
			light = "latte",
			dark = "mocha",
		},
	},
	config = function(_, opts)
		vim.o.background = os.getenv("theme") or "dark"
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
