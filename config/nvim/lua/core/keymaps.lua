-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
	local options = {
		noremap = true,
		silent = true,
	}
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = ","

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- disable keys
local disable_keys = { "<up>", "<left>", "<down>", "<right>", "gh", "gl", "gL", "<C-f>", "<C-b>", "<C-e>", "<C-y>" }
for _, disable_key in pairs(disable_keys) do
	map("", disable_key, "<nop>")
end

-- Custom Navigation
map({ "n", "v" }, '"', "%") -- " to jump to matching closer
map({ "n", "v" }, "H", "_") -- H to go the start of line(n)
map({ "n", "v" }, "L", "$") -- L to go to the end of line(n)
map({ "n", "v" }, "K", "{") -- L to jump next blocks(n)
map({ "n", "v" }, "J", "}") -- J to jump previous blocks(n)

-- Lines
map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- Tabs
map("n", "<leader>tt", ":tabedit<CR>") -- open buffer in new tab
map("n", "<leader>tn", ":tabnext<CR>") -- go to next tab
map("n", "<leader>tp", ":tabprev<CR>") -- go to prev tab
map("n", "<leader>to", ":tabonly<CR>") -- kill all other tabs
map("n", "<leader>tk", ":tabclose<CR>") -- kill current tab
map("n", "<leader>tg", ":tab G<CR>") -- Open git fugitive in separate tab

-- Buffers
map("n", "<leader>bk", ":lua MiniBufremove.delete()<cr>") -- delete current buffer
map("n", "<leader>q", ":bufdo bdelete<CR>:lua MiniStarter.open()<cr>") -- kill all buffers

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Indent
map("n", ">", ">>") -- quick indent
map("n", "<", "<<") -- quick indent
map("v", "<", "<gv") -- stay in indent mode
map("v", ">", ">gv") -- stay in indent mode

-- Others
map("v", "p", '"_dP') -- keep the yanked when pasting in visual mode
map("v", "@", ":normal @") -- apply macro on visual range
map("t", "<Esc>", [[<C-\><C-n>]]) -- esc exit terminal
map("n", "<Esc>", ":nohl<CR>") -- clear search highlights
map("n", "<leader>r", ":so %<CR>") -- Reload configuration without restart nvim
map("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>") -- open link under cursor

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Hop
map({ "n", "v" }, "ss", ":HopChar2MW<CR>") -- sneak s
map({ "n", "v" }, "mw", ":HopWord<CR>") -- Jump to word on current visible buffer

-- Telescope
map("n", "<C-b>", ":Telescope buffers<CR>") -- list all open buffers
map("n", "<C-p>", ":Telescope find_files<CR>") -- find file in dir
map("n", "<C-n>", ":Telescope file_browser<CR>") -- open/close file browser
map("n", "mS", ":Telescope live_grep<CR>") -- find text in current dir
map("n", "mt", ":TodoTrouble<CR>") -- open todo list

-- NOTE: New keymap
map({ "n", "v" }, '%', '"') -- % for working with the register

-- other keybindings in:
-- plugins.lsp/handlers
-- plugins.nvim-cmp
-- plugins.telescope/file-explorer
-- plugins.toggleterm -> <C-t>
