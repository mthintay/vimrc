set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'posva/vim-vue'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
  let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme='onedark'

colorscheme onedark

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax enable

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

" SNIPPETS
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

set background=dark		" Assume a dark bg
set number			" Activate line numbers
set relativenumber
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
set showmode

set wildignore+=node_modules/*,wp-admin/*,wp-includes/*

let mapleader = ","
let g:mapleader = ","

" MAPPINGS
nmap <Leader><space> :nohlsearch<cr>

" AUTO COMMANDS
augroup autosourcing
	autocmd!
	autocm BufWritePost .vimrc source %	" Auto source file on save
augroup END

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -all --ignore /wp-admin --ignore /wp-includes --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
