vim.opt_local.spell = true -- enable spell check
vim.opt_local.wrap = true
vim.opt_local.linebreak = true -- break at words
vim.b.miniindentscope_disable = true

local buf_map = require("core.utils").buf_map

buf_map("n", "j", "gj", { desc = "move down wrapped lines" })
buf_map("n", "k", "gk", { desc = "move up wrapped lines" })

-- buf_map("n", "<leader>rr", function()
-- 	local cmd = string.format('TermExec cmd="%s"<cr>', "glow %:p")
-- 	vim.cmd(cmd)
-- 	buf_map({ "n", "t" }, "q", "<cmd>close<cr>")
-- end, { desc = "preview file using glow" })
--
vim.cmd([[
function s:toggle(pattern, dict, ...)
  let view = winsaveview()
  execute 'keeppatterns s/' . a:pattern . '/\=get(a:dict, submatch(0), a:0 ? a:1 : " ")/e'
  return view
endfunction
nnoremap <buffer> <silent> - :call winrestview(<SID>toggle('^\s*-\s*\[\zs.\ze\]', {' ': '-', '-': 'x', 'x': ' '}))<cr>
]])
