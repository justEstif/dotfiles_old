-----------------------------------------------------------
-- Command functions
-----------------------------------------------------------

local command = function(command, target)
	vim.api.nvim_create_user_command(command, target, {})
end

command("Gpush", "G push") -- add fugitive push
