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

-- @desc go to website
M.go_to_url = function(cmd)
	local url = vim.fn.expand("<cfile>", nil, nil)
	if not url:match("http") then
		url = "https://github.com/" .. url
	end
	vim.fn.jobstart({ cmd or "xdg-open", url }, { on_exit = function() end })
end

-- @desc expand or minimize current buffer in a more natural direction (tmux-like)
M.resize = function(vertical, margin)
	local cur_win = vim.api.nvim_get_current_win()
	-- go (possibly) right
	vim.cmd(string.format("wincmd %s", vertical and "l" or "j"))
	local new_win = vim.api.nvim_get_current_win()

	-- determine direction cond on increase and existing right-hand buffer
	local not_last = not (cur_win == new_win)
	local sign = margin > 0
	-- go to previous window if required otherwise flip sign
	if not_last == true then
		vim.cmd([[wincmd p]])
	else
		sign = not sign
	end

	local sign_str = sign and "+" or "-"
	local dir = vertical and "vertical " or ""
	local cmd = dir .. "resize " .. sign_str .. math.abs(margin) .. "<CR>"
	vim.cmd(cmd)
end

return M
