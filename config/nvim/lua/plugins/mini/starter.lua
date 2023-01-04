local status, starter = pcall(require, "mini.starter")
if not status then
	print("mini.starter error")
	return
end

starter.setup({
	content_hooks = {
		starter.gen_hook.aligning("center", "center"),
		starter.gen_hook.adding_bullet(),
	},
	evaluate_single = true,
	footer = os.date(),
	header = table.concat({
		[[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
		[[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
		[[/ /\  /  __/ (_) \ V /| | | | | | |]],
		[[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
		[[───────────────────────────────────]],
	}, "\n"),
	query_updaters = "eEfFlLqQ",
	items = {
		{ action = "NvimTreeToggle", name = "F: NvimTree", section = "Plugins" },
		{ action = "Lazy", name = "L: Lazy", section = "Plugins" },
		{ action = "enew", name = "E: New Buffer", section = "Builtin actions" },
		{ action = "qall!", name = "Q: Quit Neovim", section = "Builtin actions" },
	},
})
