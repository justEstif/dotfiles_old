-- Toggleterm configuration file
local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 18,
	shade_terminals = false,
	open_mapping = "<leader>t",
	direction = "horizontal",
	persist_size = true,
})

-- set keymap
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*",
	callback = function()
		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = true })
	end,
})
