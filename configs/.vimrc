set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" *********************************************************************************************************************
" PLUGINS START 
" *********************************************************************************************************************

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'

Plugin 'airblade/vim-gitgutter'

Plugin 'tmhedberg/SimpylFold'

Plugin 'editorconfig/editorconfig-vim'

" Multi-line cursor
Plugin 'mg979/vim-visual-multi'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'xuyuanp/nerdtree-git-plugin'

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Auto-complete | Python
Bundle 'Valloric/YouCompleteMe'


Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tomasiser/vim-code-dark'

Plugin 'Yggdroot/indentLine'

Plugin 'cj/vim-webdevicons'

" -----------------------------------------------
" Python
" -----------------------------------------------
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'jmcantrell/vim-virtualenv'

" -----------------------------------------------
" Elixir 
" -----------------------------------------------
Plugin 'elixir-editors/vim-elixir'

" *********************************************************************************************************************
" PLUGINS END
" *********************************************************************************************************************
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" *********************************************************************************************************************

" *********************************************************************************************************************
" CONFIGS
" *********************************************************************************************************************
" -----------------------------------------------
" GENERAL
" -----------------------------------------------
syntax on
colorscheme codedark
let mapleader=","       " leader is comma
set clipboard=unnamedplus
" Gvim
set guifont=Cascadia\ Code\ 13
set guioptions -=m  " gvim hide menubar
set guioptions -=T  " gvim hide toobar
set guioptions -=r  " gvim hide scrollbar
set guioptions -=L  " gvim hide left hand scroll bar
set guioptions -=M  " gvim hide menubar (extreme version)
set go=c
set nowrap          " set wrap!
set linespace=5

set ignorecase      " find case insensitive
set number          " show line numbers
set numberwidth=2   " width of number bar
set showmatch       " highlight matching <[{()}]>
set autoindent      " set autoindenting on
set copyindent      " copy the indentation from previous line

set encoding=utf-8
set background=dark
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set foldenable          " enable folding
set foldmethod=indent
set foldlevel=99
set ruler
set splitbelow
set splitright
set mouse=a             " enable mouse

" find with Ctrl+F
nmap <C-f> ?
" select all
nmap <C-a> ggVG
" folding using sapace
nnoremap <space> za
" save session
nnoremap <leader>s :mksession<CR>

" split navigations
nmap <leader><Down> <C-W><C-J>
nmap <leader><Up> <C-W><C-K>
nmap <leader><Right> <C-W><C-L>
nmap <leader><Left> <C-W><C-H>

" move lines normal mode
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
" move lines visual mode
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Split resize
" nmap <A-Up>   :vertical resize +5<CR>
" nmap <A-Down> :vertical resize -5<CR>
" nmap <A-Right>   :resize +5<CR>
" nmap <A-Left> :resize -5<CR>


" -----------------------------------------------
" vim-airline
" -----------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:CSApprox_loaded = 1
let g:airline_theme = 'powerlineish'
let g:airline_theme='violet'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''


" -----------------------------------------------
" IndentLine
" -----------------------------------------------
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1


" -----------------------------------------------
" tmhedberg/SimpylFold
" -----------------------------------------------
let g:SimpylFold_docstring_preview=1


" -----------------------------------------------
" Nerdtree
" -----------------------------------------------
nmap <C-b> :NERDTreeFind<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <silent> <F3> :NERDTreeToggle<CR>


"--------------------------------------------------
" Nerd Tree git status
" -----------------------------------------------
let g:NERDTreeGitStatusIndicatorMapCustom = {
        \ 'Modified'  :'✹',
        \ 'Staged'    :'✚',
        \ 'Untracked' :'✭',
        \ 'Renamed'   :'➜',
        \ 'Unmerged'  :'═',
        \ 'Deleted'   :'✖',
        \ 'Dirty'     :'✗',
        \ 'Ignored'   :'☒',
        \ 'Clean'     :'✔︎',
        \ 'Unknown'   :'?',
        \ }


" -----------------------------------------------
" fzv
" -----------------------------------------------
map ; :Files<CR>


" -----------------------------------------------
" Valloric/YouCompleteMe
" -----------------------------------------------
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" *********************************************************************************************************************
" LANGUAGE SPECIFIC SETTINGS 
" *********************************************************************************************************************
" -----------------------------------------------
" Python
" -----------------------------------------------
let python_highlight_all=1

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ | set softtabstop=4
    \ | set shiftwidth=4
    \ | set textwidth=79
    \ | set expandtab
    \ | set autoindent
    \ | set fileformat=unix

augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF


