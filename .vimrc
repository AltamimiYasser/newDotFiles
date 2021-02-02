syntax enable
filetype on
filetype indent on
filetype plugin on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set wrap
set smartcase
set noswapfile
set nobackup
set undodir=/.vim/undodir
set undofile
set incsearch
set encoding=utf-8
set nocompatible
set shell=/bin/zsh
set path+=** " search down into subfolders
set wildmenu
set colorcolumn=80

let ruby_operators=1
let ruby_pseudo_operators=1
let ruby_space_errors = 1
let ruby_line_continuation_error=1
let ruby_global_variable_error=1
let ruby_fold=1
let ruby_spellcheck_strings = 1
let g:ruby_indent_assignment_style='variable'

" indentation line use color scheme
let g:indentLine_setColor=0 

" each indent line has a distinct character
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back

highlight ColorColumn ctermbg=0 guibg=lightgrey 

autocmd! bufwritepost $MYVIMRC source $MYVIMRC

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'

" check plug and install neccery pluging
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "

" ii to go normal mode 
inoremap ii <Esc><Esc>
vnoremap ii <Esc><Esc>


" ctrl+t to open a new window and split the screen verticaly and wait for file
" name
nnoremap <C-t> :vsp new <CR>:edit 
inoremap <C-t> <Esc><Esc>:vsp new <CR>:edit

" use leader plus hjkl to move between open windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" formation with F7
nnoremap <F7> gg=G
inoremap <F7> <Esc><Esc>gg=G'.i

" leader+vimrc open vimrc file from anyfile
map <leader>vimrc :vsp new <CR>:edit $MYVIMRC<CR>

" zz to put screen in the middle while in insert mode
inoremap zz <C-o>zz

" map leader+u to undotree
nnoremap <leader>u :UndotreeShow<CR>
