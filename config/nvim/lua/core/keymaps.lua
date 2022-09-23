-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local map = require("core.utils").map

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
map("n", "<leader>q", ":%bd!<CR>:lua MiniStarter.open()<cr>") -- kill all buffers

-- Indent
map("v", "<", "<gv") -- stay in indent mode
map("v", ">", ">gv") -- stay in indent mode

-- Others
map("v", "p", '"_dP') -- keep the yanked when pasting in visual mode
map("v", "@", ":normal @") -- apply macro on visual range
map("t", "<Esc>", [[<C-\><C-n>]]) -- esc exit terminal
map({ "n", "v" }, "<Esc>", ":nohl<CR>") -- clear search highlights
map("n", "<leader>r", ":so %<CR>") -- Reload configuration without restart nvim
map("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>") -- open link under cursor

-- Netrw
map('n', '<leader>dd', ":Lexplore %:p:h<CR>")
map('n', '<leader>da', ":Lexplore<CR>")

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>") -- find file in dir
map("n", "ms", ":Telescope live_grep<CR>") -- find text in current dir
map("n", "mt", ":TodoTelescope<CR>") -- open todo list

-- other keybindings in:
-- plugins.lsp/handlers
-- plugins.nvim-cmp
-- plugins.telescope/file-explorer
-- plugins.toggleterm -> <C-t>
