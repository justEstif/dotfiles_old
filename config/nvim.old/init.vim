filetype off
filetype plugin indent on

call plug#begin('~/.vim/plugged')
" move with 's'
Plug 'justinmk/vim-sneak'
" za to fold
Plug 'pseewald/vim-anyfold'
" :BD kills buffer
Plug 'qpkorr/vim-bufkill'
" indent guide
Plug 'Yggdroot/indentLine'
" auto pair brackets
Plug 'chun-yang/auto-pairs'
" better scrolling animation
Plug 'yuttie/comfortable-motion.vim'
Plug 'wakatime/vim-wakatime'
" easy comment
Plug 'joom/vim-commentary'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" file explorer
Plug 'preservim/nerdtree'
" fzf
Plug 'ctrlpvim/ctrlp.vim'
" coding
Plug 'sheerun/vim-polyglot'
" html/css
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
" lsp
Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'yarn install'}
" react
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" tailwind
" writing
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
" git 
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'
" themes
call plug#end()
" set theme

syntax on
set mouse=a
set noshowmatch
set nocompatible
set textwidth=80
set modelines=0
" no line number
set nonumber
set encoding=utf-8
" search both cases
set smartcase
" visual word wrap
set wrap
" define tab
set tabstop=2
set shiftwidth=2
" delete tab easy
set softtabstop=2
" use spaces as tabs
set expandtab
" round indent to shiftwidth
set noshiftround
" indent based on style
set smartindent
set nohlsearch
" don't close files if other file is opened
set hidden
" no sound use visual
set noerrorbells
set visualbell
set noswapfile
set nobackup
" save undo history
set undodir=~/.vim/undodir
set undofile
" update search as continue type
set incsearch
" don't hide typed
set conceallevel=0
" improve pop up menu
" set completeopt=noinsert,menuone,noselect
set completeopt=longest,menuone
" command line completion
set wildmenu

" how to remove blankspace after bullet point in md
setlocal formatoptions=tqlnrc
set comments=b:>

" set working dir to curr file
set autochdir
" set ctrl p to the local dir as well
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" don't show some files
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\'
" allow copy paste
set clipboard^=unnamed,unnamedplus

" autocomplete height
set pumheight=20

" new windows bottom half
set splitbelow

" remove tilde on rempty lines
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾

" Fixes common backspace problems
set backspace=indent,eol,start

" Display different types of white spaces.
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" remove auto commenting next lines
au BufEnter * set fo-=c fo-=r fo-=o

" no highlight on space between windows
highlight VertSplit cterm=NONE

" PlugIn setups

" nerd
let NERDTreeHighlightCursorline=0
" Automatically close NERDTree when you open a file
let NERDTreeQuitOnOpen=1
" markdown
let g:vim_markdown_new_list_item_indent = 0
" Disable math tex conceal feature
let g:tex_conceal = ''
let g:vim_markdown_math = 1

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['tsx=typescriptreact']
let g:vim_markdown_conceal_code_blocks = 0
" airline
let g:airline#extensions#tabline#enabled = 1
let g:coc_node_path = '/home/estifanos/.nvm/versions/node/v16.15.0/bin/node'

" folding
autocmd Filetype * AnyFoldActivate
set foldlevel=0
set foldlevel=99

" using leaderkey
let mapleader = " " " map leader to space

" Custom function
function! ToggleLineNumber()
  if v:version > 703
    set norelativenumber!
  endif
  set nonumber!
endfunction

" Custom shortcuts
map <leader>l :call ToggleLineNumber()<CR>
map <leader>f :NERDTreeToggle<CR>
map <leader>t :sp<CR>:terminal<CR>
map <leader>bk :BD<CR>
map <leader>bK :BD!<CR>
map <leader>qq :q<CR>

" Keymappings
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" move through windows
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" scroll pop up with C-j/C-k
inoremap <expr> <C-j><CR> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k><CR> ((pumvisible())?("\<C-p>"):("k"))

" jk == esc
inoremap jk <Esc>

" easier exit terminal
tnoremap <Esc> <C-\><C-n>
" move line with alt
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" improve navigation with hjkl
noremap K     5k
noremap J     5j
noremap H     ^
noremap L     $
nnoremap Y y$
" get rid of suspend mode
nnoremap <c-z> <nop>
" Language server stuff
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Auto Commands
augroup auto_commands
    autocmd BufWrite *.js call CocAction('format')
    autocmd BufWrite *.ts call CocAction('format')
    autocmd BufWrite *.jsx call CocAction('format')
    autocmd BufWrite *.tsx call CocAction('format')
augroup END

" Explore -> make it look like nerdtree 
" don't show hidden on default
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex
" set the width
let g:netrw_winsize = 25
" remove banner, toggle using I
let g:netrw_banner = 0
" set the better view type as default
let g:netrw_liststyle = 3
" open new files in vertical split
let g:netrw_browse_split = 4
let g:netrw_altv = 1
