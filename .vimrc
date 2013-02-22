set nocompatible

set number          "enable line numbering
set tabstop=4
set shiftwidth=4    "tabs to spaces.

set showmatch       "briefly jump to matching parentheses/braces/brackets

set ruler           "statusline with current cursos position
"set nohls          "don't highlight search terms
set hlsearch        "highlight search terms

" incremental search with ignore case
set incsearch
set ignorecase
set smartcase

" enable syntax highligithing
set t_Co=256
syntax enable
set bg=dark

" disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

set pastetoggle=<F2>

" Shortcuts
""""""""""""""""""
" Tabs
map <F8> :tabn<CR>
map <F7> :tabp<CR>

" line number toggle
map <C-N><C-N> :set invnumber<CR>

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
