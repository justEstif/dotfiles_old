-----------------------------------------------------------
-- Mini indent configuration file
----------------------------------------------------------
local status_indentscope, mini_indentscope = pcall(require, "mini.indentscope")
if not status_indentscope then
	return
end

mini_indentscope.setup({
	draw = { delay = 0 },
})

-- disable
vim.cmd("au FileType NvimTree lua vim.b.miniindentscope_disable = true")
