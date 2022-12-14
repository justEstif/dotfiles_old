local _winnr
local _prompt_str = "New Name❯ "

local function rename()
	local currName = vim.fn.expand("<cword>")
	local opts = {
		style = "minimal",
		border = "rounded",
		relative = "cursor",
		width = 40,
		height = 1,
		row = 1,
		col = 1,
	}
	local bufnr = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_option(bufnr, "bufhidden", "wipe")

	_winnr = vim.api.nvim_open_win(bufnr, true, opts)
	vim.api.nvim_win_set_option(_winnr, "scrolloff", 0)
	vim.api.nvim_win_set_option(_winnr, "sidescrolloff", 0)
	vim.api.nvim_buf_set_option(bufnr, "modifiable", true)
	vim.api.nvim_buf_set_option(bufnr, "buftype", "prompt")

	vim.fn.prompt_setprompt(bufnr, _prompt_str)
	vim.fn.matchaddpos("Conditional", { { 1, 1, #_prompt_str } })

	vim.api.nvim_command("startinsert!")
	vim.api.nvim_feedkeys(currName, "n", true)

	local map_opts = { silent = true, buffer = bufnr }
	vim.keymap.set("i", "<esc>", "<CMD>stopinsert <BAR> q!<CR>", map_opts)
	vim.keymap.set("i", "<C-c>", "<CMD>stopinsert <BAR> q!<CR>", map_opts)
	vim.keymap.set("i", "<CR>", "<CMD>stopinsert <BAR> lua require('plugins.lsp.rename')._rename()<CR>", map_opts)
end

-- see neovim #15504
-- https://github.com/neovim/neovim/pull/15504#discussion_r698424017
local function handler(...)
	local result
	local method
	local err = select(1, ...)
	local is_new = not select(4, ...) or type(select(4, ...)) ~= "number"
	if is_new then
		method = select(3, ...).method
		result = select(2, ...)
	else
		method = select(2, ...)
		result = select(3, ...)
	end
	if err then
		vim.notify(("Error running LSP query '%s': %s"):format(method, err), vim.log.levels.WARN)
		return
	end
	-- echo the resulting changes
	local info = function(msg)
		vim.cmd("echohl Directory")
		for _, s in ipairs(vim.fn.split(msg, "\n")) do
			vim.cmd("echom '" .. s:gsub("'", "''") .. "'")
		end
		vim.cmd("echohl None")
	end

	if result and (result.changes or result.documentChanges) then
		for f, c in pairs(result.changes or result.documentChanges) do
			info(('"%s", %d change(s)'):format(c.textDocument and c.textDocument.uri or f, #c))
		end
	end
	vim.lsp.handlers[method](...)
end

local function _rename()
	local winnr = vim.api.nvim_get_current_win()
	if winnr ~= _winnr then
		return
	end
	local newName = vim.trim(vim.fn.getline("."):sub(#_prompt_str, -1))
	vim.api.nvim_win_close(winnr, true)
	local params = vim.lsp.util.make_position_params()
	local currName = vim.fn.expand("<cword>")
	if not (newName and #newName > 0) or newName == currName then
		return
	end
	params.newName = newName
	vim.lsp.buf_request(0, "textDocument/rename", params, handler)
end

return { rename = rename, _rename = _rename }
