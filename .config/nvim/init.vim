call plug#begin('~/.config/nvim/plugged')
  Plug 'bwot/init.neovim'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
call plug#end()

" Use space instead of \ as leader
let mapleader=" "                           

" Colorscheme
highlight Normal ctermbg=black ctermfg=white
set background=dark                     
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

" Escape is very very far from the homerow
inoremap jj <esc>
" Stop the highlighting with ctrl-l
nmap <C-l> :noh<CR>
