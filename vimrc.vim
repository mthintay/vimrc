set nocompatible

colorscheme badwolf

syntax enable
filetype plugin on

" FILE SEARCH
set path+=**			" Also search in sub folders
set wildmenu			" Use tab to auto complete search

" TIPS
" - Hit tab to :find partial matches
" - Use an * to use fuzzy search
" - :b to autocomplete open buffers

" TAG JUMP
command! MakeTags !ctags -R .

" TIPS
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" AUTOCOMPLETE
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" TIPS
" - :edit a folder to open a file browser
" - >CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" SNIPPETS
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

set background=dark		" Assume a dark bg
set number			" Activate line numbers
set ignorecase
set smartcase
set hlsearch			" Highlight search term
set incsearch			" Set incremental search
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cursorline
set nowrap
set showcmd

let mapleader = ","
let g:mapleader = ","

" MAPPINGS
nmap <Leader><space> :nohlsearch<cr>

" AUTO COMMANDS
augroup autosourcing
	autocmd!
	autocm BufWritePost .vimrc source %	" Auto source file on save
augroup END
