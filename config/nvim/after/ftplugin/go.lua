local buf_map = require("core.utils").buf_map

local insert_err_handling = function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local snippet = "if err != nil { return nil, err } "
	vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { snippet })
end

buf_map("n", "<leader>ee", insert_err_handling, { desc = "go err snippet" })
