require("core.fixfnkeys")

local map = require("core.utils").map

vim.g.mapleader = ","

-- Override default
map("v", "p", [["_dP]], { desc = "Keep the yanked text when pasting in visual  mode" })
map("x", "@", [[":norm @" . getcharstr() . "<cr>"]], { expr = true, desc = "Apply macro on visual range" })
map("n", "<C-l>", function()
	require("mini.jump").stop_jumping()
	vim.cmd.nohlsearch()
	vim.cmd.echo()
end, { desc = "clear highlights" })

map("n", "]b", ":bnext<CR>", { desc = "navigate buffers" })
map("n", "[b", ":bprevious<CR>", { desc = "navigate buffers" })
map("n", "<leader>cd", ":tcd %:p:h<cr>", { desc = "change cwd" })
-- if one buffer quit, else close buffer
vim.cmd([[
  func  Smart_qq()
    if expand('%') == '' && ( len( filter( range(1, bufnr('$')),  'buflisted(v:val)' ) )  == 1 )
      exe 'q'
    else
      exe 'bd'
    endif
  endfunc
  nn  <leader>q :call Smart_qq()<cr>
]])

-- NvimTree
map("n", "<leader>f", ":NvimTreeToggle<CR>")

-- Telescope
map("n", "<F1>", ":Telescope help_tags<cr>", { desc = "help tags" })
map("n", "<leader>s", ":Telescope live_grep<CR>", { desc = "Search in cwd" })
map("n", "<leader><leader>", ":Telescope find_files<CR>", { desc = "Find files in cwd" })
map("n", "z=", ":Telescope spell_suggest<CR>", { desc = "Spell suggest keybind" })
