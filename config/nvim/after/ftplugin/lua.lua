-----------------------------------------------------------
-- Lua filetype
----------------------------------------------------------

local bind = function(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
end

bind("<leader>rr", ":so %<CR>") -- Reload configuration without restart nvim
