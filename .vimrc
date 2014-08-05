" vim:fdm=marker
call pathogen#infect()
set nocompatible              " be iMproved, required
filetype off                  " required
"testing some git stuff
" ***VUNDLE***{{{
" ************

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let vundle manage itself
Plugin 'gmark/Vundle.vim'

" Plugins
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'

" Javascript Only
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/javascript-libraries-syntax.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
""}}}
" ***SETTINGS***{{{
" **************
" Automatic reloading of .vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Enable syntax highlighting. You need to reload this file for the change to
" apply.
filetype on

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" Hide the mouse pointer while typing
set mousehide

" Window on startup settings for gvim
set lines=1000 columns=1000

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
syntax enable
set background=dark
colorscheme molokai

" Add a nice font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Consolas\ 11
  elseif has("gui_macvim")
    set guifont=Consolas\ Regular:h11
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" format
set autoindent
set smartindent

" Showing line numbers and length
set number relativenumber
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn guibg=#151515

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" No blinking of the cursor
set guicursor+=a:blinkon0

" Tell vim to remember certain things when we exit
" "  '10  :  marks will be remembered for up to 10 previously edited files
" "  "100 :  will save up to 100 lines for each register
" "  :20  :  up to 20 lines of command-line history will be remembered
" "  %    :  saves and restores the buffer list
" "  n... :  where to save the viminfo files
"set viminfo='10,\"100,:20,%,n~/.viminfo'
set viminfo='10,\"100,:20,%,n~/.viminfo'
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

" save cursor position
augroup resCur
 autocmd!
 autocmd BufWinEnter * call ResCur()
augroup END

" Adjust insert keycode timeout length
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Whats up with the $ signs
set nolist

" Use highlists for search (type nohlsearch for none)
set hlsearch
""}}}
" ***MAPPINGS*** {{{
" **************

" Rebind <Leader> key
let mapleader = ","

" disable scrolling to the left and right
nmap <C-ScrollWheelLeft> <nop>
nmap <C-ScrollWheelRight> <nop>
nmap <S-ScrollWheelLeft> <nop>
nmap <S-ScrollWheelRight> <nop>
nmap <ScrollWheelLeft> <nop>
nmap <ScrollWheelRight> <nop>

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
inoremap <C-n> :nohl<CR>
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" easier moving between tabs
map <Leader>h <esc>:tabprevious<CR>
map <Leader>l <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" Clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Disable help
map <F1> <Esc>
imap <F1> <Esc>

" Better copy & paste
" " When you want to paste large blocks of code into vim, press F2 before you
" " paste. At the bottom you should see ``-- INSERT (paste) --``.
" set pastetoggle=<F2>
" set clipboard=unnamed
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" map dot to ; because azerty :(
map ; .

" set folding to space
nnoremap <Space> za
""}}}
" ***PLUGINS***{{{
" **************

""""""""""""""""""""""""""""""
""""""" EASYMOTION
nmap s <plug>(easymotion-s)
let g:easymotion_do_mapping = 0 " disable default mappings
" turn off case sensitive feature
let g:easymotion_smartcase = 1

""""""""""""""""""""""""""""""
""""""" POWERLINE
set laststatus=2

""""""""""""""""""""""""""""""
""""""" NERDTREE
map <leader>r :NERDTreeToggle<cr>

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Open NERDTree on startup
autocmd vimenter * NERDTree

""""""""""""""""""""""""""""""
""""""" YOU COMPLETE ME
" these are the tweaks i apply to ycm's config, you don't need them but they
" might help.  ycm gives you popups and splits by default that some people
" might not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
set completeopt=longest,menuone
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"

""""""""""""""""""""""""""""""
""""""" SYNTASTIC
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = ['jshint']

""""""""""""""""""""""""""""""
""""""" JAVASCRIPT SYNTAX
" Enable folding
function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
""}}}
