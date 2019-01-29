set nocompatible
syntax enable
filetype plugin indent on

"colorscheme desert

" General
set autoindent          " Enable auto indenting
set background=dark     " Assume a dark bg
set number              " Always show line numbers
set relativenumber
set ignorecase          " Ignore case when searching
set smartcase           " Ignore case if search pattern is all lowercase
set hlsearch            " Highlight search term
set incsearch           " Set incremental search
set tabstop=4           " A tab is 4 spaces
set shiftwidth=4        " Number of spaces to use for autoindenting
set shiftround          " Use multiple of shiftwidth when indenting with '<' and '>'
set softtabstop=4       " When hitting <BS>, pretend like a tab is removed, even if spaces
set smarttab
set expandtab           " Expand tabs by default
set copyindent          " Copy the previous indentation on autoindenting
set nowrap              " Don't wrap lines
set showcmd
set showmode            " Always show what mode we're currently editing in
set novisualbell        " Don't beep
set noerrorbells        " Don't beep
set autowrite           " Save on buffer switch
set tags=tags
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set timeout timeoutlen=200 ttimeoutlen=100
set wildignore+=*.swp,*.bak,*.pyc,*.class,*.o
set showmatch           " Show matching brackets
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set title

" File search
set path+=**
set wildmenu

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Mappings
let mapleader = ","
let g:mapleader = ","
nmap <Leader><space> :nohlsearch<cr>

" Treat long lines as break lines
map j gj
map k gk

" Remap jj to ESC in insert mode
inoremap jj <Esc>

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Edit vimrc with ,ev
nnoremap <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>

" Auto commands
augroup autosourcing
	autocmd!
	autocm BufWritePost .vimrc source % " Auto source file on save
augroup END

