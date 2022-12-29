local M = {}

-- @desc function for global keymapping
M.map = function(mode, lhs, rhs, opts)
	local options = { silent = true }

	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- @desc function for buffer keymapping
M.buf_map = function(mode, lhs, rhs, opts)
	local options = { silent = true, buffer = true }

	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- @desc Run the current file according to filetype
M.run_file = function()
	local fts = {
		python = "python %",
		javascript = "node %",
		typescript = "ts-node %",
		go = "go run %",
	}

	local cmd = string.format('TermExec cmd="%s"<cr>', fts[vim.bo.ft])
	vim.cmd(cmd)
end

-- @desc create custom cmds
M.cmd = function(input, action, opts)
	vim.api.nvim_add_user_command(input, action, opts)
end

-- @desc create autocmd
M.aucmd = vim.api.nvim_create_autocmd

-- @desc create autocmd group
M.augroup = function(name, fnc)
	fnc(vim.api.nvim_create_augroup(name, { clear = true }))
end

-- @desc disabled keys
M.disable_keys = function()
	local keys = {
		"<up>",
		"<left>",
		"<down>",
		"<right>",
		",",
		" ",
		"K",
		"<bs>",
		";",
		"<C-j>",
		"<C-p>",
		"<C-m>",
		"<C-n>",
		"+",
		"-",
		"[#",
		"]#",
		"gk",
		"gj",
		"g<Down>",
		"ge",
		"gE",
		"gw",
		"gW",
		"g~",
		"gh",
		"gl",
		"gJ",
		"gL",
		"g/",
	}

	for _, key in pairs(keys) do
		M.map("", key, "<nop>")
	end
end

-- @desc fix f-keys
M.fix_fnkeys = function()
	local mode = { "n", "v", "x", "s", "o", "i", "l", "c", "t" }
	local opts = { silent = true, nowait = true, noremap = false, remap = true }
	vim.keymap.set(mode, "<F20>", "<S-F8>", opts)
	-- vim.keymap.set(mode, "<F32>", "<C-F8>", opts)
	-- vim.keymap.set(mode, "<F44>", "<C-S-F8>", opts)
	-- vim.keymap.set(mode, "<F56>", "<M-F8>", opts)
end

return M
