-----------------------------------------------------------
-- Neoclip configuration file
----------------------------------------------------------

local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok then
	return
end

neoclip.setup({
	on_paste = {
		set_reg = false,
	},
	on_replay = {
		set_reg = false,
	},
	enable_persistent_history = true,
	keys = {
		telescope = {
			i = {
				select = "<cr>",
				paste = "<c-p>",
				paste_behind = "<c-k>",
				replay = "<c-q>", -- replay a macro
				delete = "<c-d>", -- delete an entry
				custom = {},
			},
			n = {
				select = "<cr>",
				paste = "p",
				paste_behind = "P",
				replay = "q",
				delete = "d",
				custom = {},
			},
		},
	},
})
