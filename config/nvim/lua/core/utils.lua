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
		markdown = "glow %:p",
	}
	local cmd = string.format('TermExec cmd="%s"<cr>', fts[vim.bo.ft])
	vim.cmd(cmd)
	M.buf_map({ "n", "t" }, "q", "<cmd>close<cr>")
end

-- @desc if one buffer quit, else close buffer
M.smart_qq = function()
	vim.api.nvim_command("NvimTreeClose")
	if vim.fn.expand("%") == "" and #vim.fn.filter(vim.fn.range(1, vim.fn.bufnr("$")), "buflisted(v:val)") == 1 then
		vim.api.nvim_command("quit")
	else
		vim.api.nvim_command("bdelete")
	end
end

return M
