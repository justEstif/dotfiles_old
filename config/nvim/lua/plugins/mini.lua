-----------------------------------------------------------
-- Mini configuration file
----------------------------------------------------------

-- Mini pairs
local status_pair, mini_pairs = pcall(require, "mini.pairs")
if not status_pair then
	print("mini.pairs error")
	return
end

mini_pairs.setup({})

-- Mini comment
local status_comment, mini_comment = pcall(require, "mini.comment")
if not status_comment then
	print("mini.comment error")
	return
end

mini_comment.setup({
	hooks = {
		pre = function()
			require("ts_context_commentstring.internal").update_commentstring()
		end,
	},
})

-- Mini jump2d
local status_jump2d, mini_jump2d = pcall(require, "mini.jump2d")
if not status_jump2d then
	print("mini.jump2d error")
	return
end

mini_jump2d.setup({
	mappings = {
		start_jumping = "<BS>",
	},
})

-- Mini jump
local status_jump, mini_jump = pcall(require, "mini.jump")
if not status_jump then
	print("mini.jump error")
	return
end

mini_jump.setup({
	mappings = {
		forward = "f",
		backward = "F",
		forward_till = "t",
		backward_till = "T",
		repeat_jump = "",
	},
	idle_stop = 1000,
})

-- Mini ai
local status_ai, mini_ai = pcall(require, "mini.ai")
if not status_ai then
	print("mini.ai error")
	return
end

mini_ai.setup({
	search_method = "cover_or_nearest",
})

-- Mini surround configuration file
local status_surround, mini_surround = pcall(require, "mini.surround")
if not status_surround then
	print("mini.surround error")
	return
end

-- Replace vim-surround:
mini_surround.setup({
	mappings = {
		add = "ys",
		delete = "ds",
		find = "",
		find_left = "",
		highlight = "",
		replace = "cs",
		update_n_lines = "",
		-- Add this only if you don't want to use extended mappings
		suffix_last = "",
		suffix_next = "",
	},
	search_method = "cover_or_nearest",
})
-- Remap adding surrounding to Visual mode selection
vim.api.nvim_del_keymap("x", "ys")
vim.api.nvim_set_keymap("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { noremap = true })
-- Make special mapping for "add surrounding for line"
vim.api.nvim_set_keymap("n", "yss", "ys_", { noremap = false })

--- Mini Starter configuration file
local mini_starter_status, mini_starter = pcall(require, "mini.starter")
if not mini_starter_status then
	return
end

mini_starter.setup({
	content_hooks = {
		mini_starter.gen_hook.adding_bullet(""),
		mini_starter.gen_hook.aligning("center", "center"),
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
	query_updaters = [[abcdeghiloqrstuvwxyz0123456789_-,.ABCDEGHIJKLOQRSTUVWXYZ]],
	items = {
		{ action = "PackerSync", name = "U: Update Plugins", section = "Plugins" },
		{ section = "Settings", name = "S: Settings", action = ":e $MYVIMRC<CR>" },
		{ action = "qall!", name = "Q: Quit Neovim", section = "Builtin actions" },
	},
})

vim.cmd([[
  augroup MiniStarterJK
    au!
    au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
    au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
    au User MiniStarterOpened nmap <buffer> <C-p> <Cmd>Telescope find_files<CR>
  augroup END
]])
