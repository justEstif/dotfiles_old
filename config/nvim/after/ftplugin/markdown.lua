vim.opt_local.spell = true -- enable spell check
vim.opt_local.wrap = true
vim.opt_local.linebreak = true -- break at words
vim.opt_local.joinspaces = true -- autoinsert two spaces after '.', '?', '!' for join command.

vim.b.miniindentscope_disable = true

local buf_map = require("core.utils").buf_map

local function toggle_checkbox()
	local line = vim.api.nvim_get_current_line()
	local pattern = "%[([ -xX])%]"
	local checkbox = line:match(pattern)
	if checkbox == " " or not checkbox then
		line = line:gsub(pattern, "[-]")
	elseif checkbox == "-" then
		line = line:gsub(pattern, "[x]")
	else
		line = line:gsub(pattern, "[ ]")
	end
	vim.api.nvim_set_current_line(line)
end

buf_map("n", "-", function()
	toggle_checkbox()
end)
