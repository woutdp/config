execute pathogen#infect()
" " URL: http://vim.wikia.com/wiki/Example_vimrc
" " Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" " Description: A minimal, but feature rich, example .vimrc. If you are a
" "              newbie, basing your first .vimrc on this file is a good choice.
" "              If you're a more advanced user, building your own .vimrc based
" "              on this file is still a good idea.
"
" "------------------------------------------------------------
" " Features {{{1
" "
" " These options and commands enable some very useful features in Vim, that
" " no user should have to live without.
"
" " Set 'nocompatible' to ward off unexpected things that your distro might
" " have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible


set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'dag/vim-fish'

filetype plugin indent on

"
" " Attempt to determine the type of a file based on its name and possibly its
" " contents. Use this to allow intelligent auto-indenting for each filetype,
" " and for plugins that are filetype specific.
" filetype indent plugin on
"
" " Enable syntax highlighting
syntax on
"
"
" "------------------------------------------------------------
" " Must have options {{{1
" "
" " These are highly recommended options.
"
" " Vim with default settings does not allow easy switching between multiple files
" " in the same editor window. Users can use multiple split windows or multiple
" " tab pages to edit multiple files, but it is still best to enable an option to
" " allow easier switching between files.
" "
" " One such option is the 'hidden' option, which allows you to re-use the same
" " window and switch from an unsaved buffer without saving it first. Also allows
" " you to keep an undo history for multiple files when re-using the same window
" " in this way. Note that using persistent undo also lets you undo in multiple
" " files even in the same window, but is less efficient and is actually designed
" " for keeping undo history after closing Vim entirely. Vim will complain if you
" " try to quit without saving, and swap files will keep you safe if your computer
" " crashes.
set hidden
"
" " Note that not everyone likes working this way (with the hidden option).
" " Alternatives include using tabs or split windows instead of re-using the same
" " window as mentioned above, and/or either of the following options:
" " set confirm
" " set autowriteall
"
" " Better command-line completion
set wildmenu
"
" " Show partial commands in the last line of the screen
set showcmd
"
" " Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" " mapping of <C-L> below)
set hlsearch
"
" " Modelines have historically been a source of security vulnerabilities. As
" " such, it may be a good idea to disable them and use the securemodelines
" " script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" " set nomodeline
"
"
" "------------------------------------------------------------
" " Usability options {{{1
" "
" " These are options that users frequently set in their .vimrc. Some of them
" " change Vim's behaviour in ways which deviate from the true Vi way, but
" " which are considered to add usability. Which, if any, of these options to
" " use is very much a personal preference, but they are harmless.
"
" " Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
"
" " Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
"
" " When opening a new line and no filetype-specific indenting is enabled, keep
" " the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" " Stop certain movements from always going to the first character of a line.
" " While this behaviour deviates from that of Vi, it does what most users
" " coming from other editors would expect.
" set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
"
 " Use visual bell instead of beeping when doing something wrong
set visualbell


" Enable use of the mouse for all modes
set mouse=a

" " Display line numbers on the left
set number

" " Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=50

"
" "------------------------------------------------------------
" " Indentation options {{{1
" "
" " Indentation settings according to personal preference.
"
" " Spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
"
" " Indentation settings for using hard tabs for indent. Display tabs as
" " two characters wide.
" "set shiftwidth=2
" "set tabstop=2
"
"
" "------------------------------------------------------------
" " Mappings {{{1
" "
" " Useful mappings
"
"
" " Map <C-L> (redraw screen) to also turn off search highlighting until the
" " next search
nnoremap <C-L> :nohl<CR><C-L>
"
" "------------------------------------------------------------
" "WOUT DE PUYSSELEIR
" "------------------------------------------------------------
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
"
" let g:gruvbox_contrast_dark = "soft" "hard/soft/medium
colorscheme gruvbox
set background=dark
"
" " This makes the comments use italic
set t_ZH=[3m
set t_ZR=[23m
" highlight Comment cterm=italic
"
" " Automatic reloading of .vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
"
" " Better copy pasting, this uses the clipboard of the computer
set clipboard=unnamedplus
set clipboard+=unnamed  " use the clipboards of vim and win
set paste               " Paste from a windows or from vim
set go+=a               " Visual selection automatically copied to the clipboard
"
" " Clean trailing whitespace
" nnoremap <C-S-a>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z
"
" " Rebind <Leader> key
let mapleader = ","
"
" " Useful settings
set history=700
set undolevels=700
"
" " Showing line numbers and length
set number relativenumber
set tw=79   " width of document (used by gd)
" set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
"
" Useful settings
set history=700
set undolevels=700

" " Disable stupid backup and swap files - they trigger too many events
" " for file system watchers
" set nobackup
" set nowritebackup
" set noswapfile
set directory^=$HOME/.vim/tmp//

" " Tell vim to remember certain things when we exit
" " "  '10  :  marks will be remembered for up to 10 previously edited files
" " "  "100 :  will save up to 100 lines for each register
" " "  :20  :  up to 20 lines of command-line history will be remembered
" " "  %    :  saves and restores the buffer list
" " "  n... :  where to save the viminfo files
" "set viminfo='10,\"100,:20,%,n~/.viminfo'
set viminfo='10,\"100,:20,%,n~/.viminfo'
function! ResCur()"
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

" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" When the page starts to scroll, keep the cursor x lines from the top and x
" lines from the bottom
set scrolloff=10
"
" " Set the command window height to 2 lines, to avoid many cases of having to
" " "press <Enter> to continue"
" set cmdheight=2
"
" " Highlight the current line
set cursorline

" Highlights a character in a python file if it is out of the character limit
augroup collumnLimit
  autocmd!
  autocmd BufEnter,WinEnter,FileType python
        \ highlight CollumnLimit ctermbg=DarkGrey guibg=DarkGrey
  let collumnLimit = 121 " feel free to customize
  let pattern =
        \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
  autocmd BufEnter,WinEnter,FileType python
        \ let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END

" " insert new line without insert mode
" nmap <S-Enter> O<Esc>
" nmap <CR> o<Esc>
"
" nmap <silent> <A-Up> :wincmd k<CR>
" nmap <silent> <A-Down> :wincmd j<CR>
" nmap <silent> <A-Left> :wincmd h<CR>
" nmap <silent> <A-Right> :wincmd l<CR>

" Better folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Opens files without folds, enable folds by typing 'zc'
set nofoldenable

" Removes whitespace on save
autocmd BufWritePre *.py :%s/\s\+$//e

" "------------------------------------------------------------
" "PLUGINS CONFIG
" "------------------------------------------------------------
" "AIRLINE
let g:airline_powerline_fonts = 1

"CTRLP (FUZZY FINDER)
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(pyc|exe|so|dll)$',
    \ }
set runtimepath^=~/.vim/bundle/ctrlp.vim

"NERDTree
nmap <leader>ne :NERDTree<cr>
let NERDTreeIgnore = ['\.pyc$']

"EASY MOTION
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" SIMPLY FOLD
" Let's you preview the docstring on fold
let g:SimpylFold_docstring_preview = 1

" Don't make the docstring foldable
let g:SimpylFold_fold_docstring = 0
