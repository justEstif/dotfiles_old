-----------------------------------------------------------
-- Mini Starter configuration file
----------------------------------------------------------

local M = {}
M.starter = function()
	local status, starter = pcall(require, "mini.starter")
	if not status then
		return
	end

	starter.setup({
		content_hooks = {
			starter.gen_hook.adding_bullet(""),
			starter.gen_hook.aligning("center", "center"),
		},
		evaluate_single = true,
		query_updaters = [[abcdefghijklmnopqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMNOPQRSTUVWXYZ]],
		footer = os.date(),
		header = table.concat({
			[[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
			[[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
			[[/ /\  /  __/ (_) \ V /| | | | | | |]],
			[[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
			[[───────────────────────────────────]],
		}, "\n"),
		items = {
			{ action = "Telescope find_files", name = "P: Files", section = "Telescope" },
			{ action = "Telescope file_browser", name = "N: Browser", section = "Telescope" },
			{ action = "tab G", name = "G: Fugitive", section = "Git" },
			{ action = "PackerSync", name = "U: Update Plugins", section = "Plugins" },
			{ action = "enew", name = "E: New Buffer", section = "Builtin actions" },
			{ action = "qall!", name = "Q: Quit Neovim", section = "Builtin actions" },
		},
	})
end

return M
