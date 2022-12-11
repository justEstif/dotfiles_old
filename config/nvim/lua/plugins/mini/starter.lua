local status, starter = pcall(require, "mini.starter")
if not status then
	print("mini.starter error")
	return
end

starter.setup({
	content_hooks = {
		starter.gen_hook.adding_bullet(""),
		starter.gen_hook.aligning("center", "center"),
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
	query_updaters = "eEqQ",
	items = {
		{ action = "enew", name = "E: New Buffer", section = "Builtin actions" },
		{ action = "qall!", name = "Q: Quit Neovim", section = "Builtin actions" },
	},
})

vim.cmd([[
  augroup MiniStarterJK
    au!
    au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
    au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
  augroup END
]])
