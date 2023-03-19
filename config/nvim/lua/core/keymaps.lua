local map = require("core.utils").map

vim.g.mapleader = " "

map("v", "p", [["_dP]], { desc = "Keep the yanked text when pasting in visual  mode" })
map("x", "@", [[":norm @" . getcharstr() . "<cr>"]], { expr = true, desc = "Apply macro on visual range" })
map("n", "<C-l>", function()
	require("mini.jump").stop_jumping()
	vim.cmd.nohlsearch()
	vim.cmd.echo()
end, { desc = "clear highlights" })

-- if one buffer quit, else close buffer
vim.cmd([[
    func  Smart_qq()
      exe 'NvimTreeClose'
      if expand('%') == '' && ( len( filter( range(1, bufnr('$')),  'buflisted(v:val)' ) )  == 1 )
        exe 'q'
      else
        exe 'bd'
      endif
    endfunc
    nn  <C-q> :call Smart_qq()<cr>
  ]])

-- NvimTree
map("n", "<leader>f", ":NvimTreeToggle<CR>")

-- Fzf
map("n", "<C-k>", ":FzfLua commands<cr>", { desc = "fzflua buffers" })
map("n", "<C-p>", ":FzfLua files<cr>", { desc = "fzflua buffers" })
map("n", "<C-\\>", ":FzfLua live_grep<cr>", { desc = "fzflua buffers" })
map("n", "<F1>", ":FzfLua help_tags<cr>", { desc = "fzflua buffers" })
map("n", "z=", ":FzfLua spell_suggest<CR>", { desc = "Spell suggest keybind" })
