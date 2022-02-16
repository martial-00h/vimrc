set nocompatible              " be iMproved, requiredirlineRefreshirlineRefreshirlineRefreshirlineRefreshirlineRefresh
filetype off                  " required

syntax on
set nu
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set laststatus=2
set showmode
set title
set splitbelow
set splitright
" set the runtime path to include Vundle and initialize
" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" SimpylFold
Plugin 'tmhedberg/SimpylFold'
" fix autoindent for pep8
Plugin 'vim-scripts/indentpython.vim'
" jedi for python auto-complete
Plugin 'davidhalter/jedi-vim'
" check syntax on each save
Plugin 'vim-syntastic/syntastic'
" PEP8 Checking
Plugin 'nvie/vim-flake8'
" file browser
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Python syntax highlighting
Plugin 'vim-python/python-syntax'

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


Plugin 'itchyny/lightline.vim'

Plugin 'tpope/vim-fugitive'

" javascript plugins
Plugin 'pangloss/vim-javascript'
" javascript snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'grvcoelho/vim-javascript-snippets'
" autocomplete
Plugin 'Valloric/YouCompleteMe'
" NOTE:
" running ./install.py causes error in npm and go, bec u dont have those,
" install npm in the future
"
" system clipboard
" cp to copy, cv to paste
Plugin 'christoomey/vim-system-copy'


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


"set background=dark
" Bundle 'sonph/onehalf', {'rtp': 'vim/'}
"set termguicolors
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set termguicolors
"set term=xterm-256color
"set term=screen-256color


"set t_Co=256
set background=dark
"if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
"    set t_ut=
"endif
"colorscheme onehalfdark
" let g:lightline = {'colorscheme': 'onehalfdark'}
"
"
"

colorscheme iceberg
let g:lightline = {'colorscheme': 'iceberg'}
"let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers

"let g:airline_theme='iceberg'
"let g:airline_powerline_fonts=1


"augroup reload_vimrc " {
"    autocmd!
"    autocmd VimEnter * AirlineToggle 
"    autocmd VimEnter * AirlineToggle 
"augroup END " }


"make vim colorscheme work on tmux
"set term=screen-256color

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"buffer next, buffer previous
noremap <C-\>   :bn<CR>
noremap <C-]>   :bp<CR>


"enable folding
set foldmethod=indent
set foldlevel=99

" enable folding with the spacebar

" PEP8 indentation for python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set encoding=utf-8 |
    \ vnoremap <silent> <C-K><C-K> :s/^/#/<cr>:noh<cr> |
    \ vnoremap <silent> <C-K><C-U> :s/^#//<cr>:noh<cr> |
"comment uncomment python


" enable html auto-complete
"function s:CompleteTags()
"  " inoremap <buffer> > ></<C-x><C-o><Esc>:startinsert!<CR><C-O>?</<CR>
"  inoremap <buffer> <F8> </<C-x><C-o><Esc>:startinsert!<CR><C-O>?</<CR>
"  inoremap <buffer> ><Leader> >
"  inoremap <buffer> ><CR> ></<C-x><C-o><Esc>:startinsert!<CR><C-O>?</<CR><CR><Tab><CR><Up><C-O>$
"endfunction
"autocmd BufRead,BufNewFile *.html,*.js,*.xml call s:CompleteTags()

" js, html, css indentation
"au BufNewFile,BufRead *.js, *.html, *.css
"    \ set tabstop=4 |
"    \ set softtabstop=4 |
"    \ set shiftwidth=4

nnoremap <C-N> <S-_><C-V><S-$>


" python virtualenv auto-complete for jedi
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    exec(open(activate_this).read(), {'__file__': activate_this})
EOF


" make python code look pretty
let python_highlight_all=1

" javascript snippet hot key
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
let g:snipMate = { 'snippet_version' : 1 }

"map leader to Space
let mapleader = " "



" NERDTree
map <leader>t :NERDTreeToggle<CR>
map <leader>f :NERDTreeFocus<CR>
let g:NERDTreeMapCustomOpen = '<Tab>'
