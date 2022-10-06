-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

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
-- Buffers
map("n", "<leader>bb", ":b <C-d>") -- buffer list
map("n", "<leader>qq", ":bufdo bdelete<CR>") -- kill all buffers
map("n", "<leader>qQ", ":bufdo bdelete<CR>:q<cr>") -- kill all buffers and quit

-- Clipboard
map({ "n", "v" }, "cy", '"*y')
map({ "n", "v" }, "cp", '"*p')

-- Should be default
map("v", "p", '"_dP') -- keep the yanked when pasting in visual mode
map("v", "<", "<gv") -- stay in indent mode
map("v", ">", ">gv") -- stay in indent mode
map("v", "@", ":normal @") -- apply macro on visual range
map("t", "<Esc>", [[<C-\><C-n>]]) -- esc exit terminal
map("n", "<Esc>", ":nohl<CR>") -- clear search highlights

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Shortcuts
map("n", "<leader>cd", [[:cd %:p:h<CR>:pwd<CR>]]) -- change wdir
map("n", "<leader>dd", ":Lexplore<CR>") -- toggle netrw
map("n", "<leader>rr", ":ReloadConfig<cr>") -- Reload configuration without restart nvim
map({ "t", "n" }, "<C-t>", [[:lua require("core.utils.term")()<cr>]]) -- toggle terminal

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

map("n", "<C-p>", ":Telescope find_files<CR>") -- tc: find file
map("n", "ms", ":Telescope live_grep<CR>") -- tc: find text
map("n", "<leader>gg", ":tab G<cr>") -- fg: open

-- scroll cmp using c-j and c-k
map("i", "<C-j>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
map("i", "<C-k>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
-- other keybindings in:
-- plugins.lsp/handlers
-- plugins.nvim-cmp
-- core.netrw -> local keybinds
