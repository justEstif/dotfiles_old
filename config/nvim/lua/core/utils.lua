local M = {}

-- @desc function for keymapping
M.map = function(mode, lhs, rhs, opts)
	local options = { silent = true }

	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

M.command = function(command, target)
	vim.api.nvim_create_user_command(command, target, {})
end

return M
