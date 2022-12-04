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

-- @desc function for global user commands
M.cmd = function(command, target)
	vim.api.nvim_create_user_command(command, target)
end

-- @desc function for buffer user commands
M.buf_cmd = function(command, target)
	vim.api.nvim_buf_create_user_command(command, target)
end

return M
