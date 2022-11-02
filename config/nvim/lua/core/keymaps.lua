-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

-- @desc keymapping function
local map = function(mode, lhs, rhs, opts)
	local options = {
		noremap = true,
		silent = true,
	}

	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- disable keys
local disable_keys = { "<up>", "<left>", "<down>", "<right>", "gh", "gl", "gL", ",", " " }
for _, disable_key in pairs(disable_keys) do
	map("", disable_key, "<nop>")
end

vim.g.mapleader = ","

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------
-- vim-unimpaired: thanks tpope
map("n", "]e", ":m .+1<CR>==", { desc = "Move line up" })
map("v", "]e", ":m '>+1<CR>gv=gv", { desc = "Move line up" })
map("n", "[e", ":m .-2<CR>==", { desc = "Move line down" })
map("v", "[e", ":m '<-2<CR>gv=gv", { desc = "Move line down" })
map("n", "]<space>", "o<esc>k", { desc = "Move empty line below" })
map("n", "[<space>", "O<esc>j", { desc = "Move empty line above" })
map("n", "[b", ":bp<cr>", { desc = "Previous buffer" })
map("n", "]b", ":bn<cr>", { desc = "Next buffer" })

-- Should be default
map("v", "p", '"_dP', { desc = "Keep the yanked text when pasting in visual  mode" })
map("v", "<", "<gv", { desc = "Stay in indent mode" })
map("v", ">", ">gv", { desc = "Stay in indent mode" })
map("x", "@", '":norm @" . getcharstr() . "<cr>"', { expr = true, desc = "Appy macro on visual range" })
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Esc exit terminal" })
map("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })

-- Shortcuts
map("n", "[f", ":NvimTreeToggle<CR>", { desc = "Open Nvim tree" })
map("n", "[q", ":%bdelete<CR>", { desc = "Close all buffers" })
map("n", "<leader>rr", ":so %<cr>", { desc = "Reload config" })

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------
map("n", "<C-p>", ":Telescope find_files<CR>", { desc = "Telescope: find files" })
map("n", "[s", ":Telescope live_grep<CR>", { desc = "Telescope: live grep" })
map("n", "[d", ":Telescope cder<cr>", { desc = "Telescope: project" })
map("n", "[g", ":tab G<cr>", { desc = "Fugitive: open" })

-- other keybindings in:
-- plugins.lsp/handlers
-- plugins.nvim-cmp
-- core.netrw -> local keybinds
