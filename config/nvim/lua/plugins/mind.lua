-----------------------------------------------------------
-- Mind configuration file
----------------------------------------------------------

local status, mind = pcall(require, "mind")
if not status then
	return
end

mind.setup({
	width = 17,
})
