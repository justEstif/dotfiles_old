-----------------------------------------------------------
-- Trouble configuration file
----------------------------------------------------------

local status, trouble = pcall(require, "trouble")
if not status then
	return
end

trouble.setup({
	action_keys = {
		close = {"<esc>", 'q'},
		cancel = {},
	},
})
