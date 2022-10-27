-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

-- map function
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

-- Should be default
map("v", "p", '"_dP') -- keep the yanked when pasting in visual mode
map("v", "<", "<gv") -- stay in indent mode
map("v", ">", ">gv") -- stay in indent mode
map("x", "@", '":norm @" . getcharstr() . "<cr>"', { expr = true }) -- apply macro on visual range
map("t", "<Esc>", [[<C-\><C-n>]]) -- esc exit terminal
map("n", "<Esc>", ":nohl<CR>") -- clear search highlights

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Shortcuts
map("n", "[f", ":NvimTreeToggle<CR>", { desc = "Open Nvim tree" }) -- toggle netrw
map("n", "[q", ":%bdelete<CR>", { desc = "Close all buffers" }) -- close all buffers

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------
map("n", "<C-p>", ":Telescope find_files<CR>", { desc = "Telescope: find files" }) -- tc: find file
map("n", "[s", ":Telescope live_grep<CR>", { desc = "Telescope: live grep" }) -- tc: find text
map("n", "[b", ":Telescope buffers<cr>", { desc = "Telescope: buffers" }) -- tc: buffer list
map("n", "[d", ":Telescope projects<cr>", { desc = "Telescope: project" }) -- change wdir

-- other keybindings in:
-- plugins.lsp/handlers
-- plugins.nvim-cmp
-- core.netrw -> local keybinds
