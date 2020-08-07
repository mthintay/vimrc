set nocompatible
syntax enable
filetype plugin indent on
set t_Co=256

"colorscheme desert
colorscheme PaperColor

" General
set autoindent          " Enable auto indenting
set background=dark     " Assume a dark bg
set number              " Always show line numbers
"set relativenumber
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
"set nowrap              " Don't wrap lines
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
set cursorline
set cursorcolumn

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

" Edit vimrc with ,ev
nnoremap <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>

" Auto commands
augroup autosourcing
	autocmd!
	autocm BufWritePost .vimrc source % " Auto source file on save
augroup END

set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
        let s = '' " complete tabline goes here
        " loop through each tab page
        for t in range(tabpagenr('$'))
                " set highlight
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " set the tab page number (for mouse clicks)
                let s .= '%' . (t + 1) . 'T'
                let s .= ' '
                " set page number string
                let s .= t + 1 . ' '
                " get buffer names and statuses
                let n = ''      "temp string for buffer names while we loop and check buftype
                let m = 0       " &modified counter
                let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
                " loop through each buffer in a tab
                for b in tabpagebuflist(t + 1)
                        " buffer types: quickfix gets a [Q], help gets [H]{base fname}
                        " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
                        if getbufvar( b, "&buftype" ) == 'help'
                                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
                        elseif getbufvar( b, "&buftype" ) == 'quickfix'
                                let n .= '[Q]'
                        else
                                let n .= pathshorten(bufname(b))
                        endif
                        " check and ++ tab's &modified count
                        if getbufvar( b, "&modified" )
                                let m += 1
                        endif
                        " no final ' ' added...formatting looks better done later
                        if bc > 1
                                let n .= ' '
                        endif
                        let bc -= 1
                endfor
                " add modified label [n+] where n pages in tab are modified
                if m > 0
                        let s .= '[' . m . '+]'
                endif
                " select the highlighting for the buffer names
                " my default highlighting only underlines the active tab
                " buffer names.
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " add buffer names
                if n == ''
                        let s.= '[New]'
                else
                        let s .= n
                endif
                " switch to no underlining and add final space to buffer list
                let s .= ' '
        endfor
        " after the last tab fill with TabLineFill and reset tab page nr
        let s .= '%#TabLineFill#%T'
        " right-align the label to close the current tab page
        if tabpagenr('$') > 1
                let s .= '%=%#TabLineFill#%999Xclose'
        endif
        return s
endfunction
