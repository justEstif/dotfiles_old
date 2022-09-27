- Keymaps to use more

  - `:jumps`
    - `C-o`: last jump
    - `C-i`: next jump
    - `<jumpNumber>C-o`: jump back
    - `<jumpNumber>C-i`: jump forward
  - macros

- https://github.com/vim-ctrlspace/vim-ctrlspace
- https://sfconservancy.org/GiveUpGitHub/
- Ideas

  - `\\` using this to do stuff

  TODO: [Make a statusline](https://elianiva.my.id/post/neovim-lua-statusline)
  TODO:

  - Using the registar more
    - remapped " => % and % => "
      - so `%ay` => copy to a
      - `%ap` => paste from a

- Learn:
  - quickfix list and location list and registers
    - usecase: using quickfix instead todos and notes
      - `:lvimgrep /TODO/ **/*` -> search recursively
        - `:lopen`
- using the quickfix lit
  - `:vimgrep /Post/ %` -> add all lines in this with Post into the quickfix list
  - `:vimgrep /Post/ **/*tsx` -> add all lines in tsx files with Post into the quickfix list
  - cycle through the quickfix list using [q, ]q
- use eslint with make command and add to quickfix list

- use makefile in vim: <https://medium.com/lithictech/makefile-javascript-26731fb26867>

vimgre: <http://vimcasts.org/episodes/search-multiple-files-with-vimgrep/>
search patterns:
<http://vimregex.com/>,
<http://vimcasts.org/episodes/refining-search-patterns-with-the-command-line-window/>,
<http://vimcasts.org/episodes/supercharged-substitution-with-subvert/>

vim regex: <https://dev.to/iggredible/learning-vim-regex-26ep>
vim magic search: <https://vim.fandom.com/wiki/Simplifying_regular_expressions_using_magic_and_no-magic>

# Search Patterns

```
/word  -> match all
/\<word\> -> match whole word only
/word\c -> case insensitive
/word\C -> case sensitive
/word\|pattern -> match word or pattern
/\v(max|min) ->
```

`:lvimgrep /\v(TODO|NOTE)/ **/*` -> add todo and note to quickfix list
TODO: Make the search exact only

clear quickfix list `:cexpr []`

The vim file is under nvim/lua/config
vim.cmd('source ' .. nvimrc .. '/lua/config/goyo.vim')```


-- { desc = "Change directory to current file", silent = false }
map("n", "cd", function()
	vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
	print("Current directory is: " .. vim.fn.getcwd())
end)
