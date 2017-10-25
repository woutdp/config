" To install run :PlugInstall
call plug#begin('~/.config/nvim/plugged')
  Plug 'bwot/init.neovim'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
  Plug 'dag/vim-fish', { 'for': 'fish' }
  Plug 'mhinz/vim-startify'
call plug#end()

" Use space instead of \ as leader
let mapleader=" "

" Enable the mouse
set mouse=a

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

" ===============
" Plugin settings
" ===============
" vim-airline
" ---------------------
" Use special font that includes fancy arrows and stuff
let g:airline_powerline_fonts = 1

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
map <leader>n :NERDTreeToggle<CR>
