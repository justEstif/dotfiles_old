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

