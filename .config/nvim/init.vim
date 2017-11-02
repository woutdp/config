" To install run :PlugInstall
call plug#begin('~/.config/nvim/plugged')
  Plug 'bwot/init.neovim'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'mhinz/vim-startify'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
  Plug 'dag/vim-fish', { 'for': 'fish' }
  Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
  Plug 'davidhalter/jedi-vim', {'for': 'python'}
  Plug 'Valloric/YouCompleteMe'
call plug#end()

" Use space instead of \ as leader
let mapleader=" "

" Enable the mouse
set mouse=a

" Don't show the preview window split. This pops up for jedi vim for example.
set completeopt-=preview

" Use fish shell
set shell=/bin/fish

" Colorscheme
highlight Normal ctermbg=black ctermfg=white
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'medium'

" Escape is very very far from the homerow
inoremap jj <esc>
"
" Stop the highlighting with ctrl-l
nmap <C-l> :noh<CR>

" Easily switch buffers
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Python specific
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" ===============
" Plugin settings
" ===============
" vim-airline
" ---------------------
" Use special font that includes fancy arrows and stuff
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 " enable airline tabline
let g:airline#extensions#tabline#buffer_min_count = 2 " only show tabline if more than one buffer is open
let g:airline#extensions#tabline#tab_min_count = 2 " only show tabline if more than one tab is open

" vim-better-whitespace
" ---------------------
" Removes trailing whitespace on end of file
autocmd BufEnter * EnableStripWhitespaceOnSave

" nerdcommenter
" -------------
" Remap the toggle comments to ctrl-/ (_ stands for /)
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" nerdtree
" --------
map <leader>m :NERDTreeToggle<CR>

" Show hidden files
let NERDTreeShowHidden=1
