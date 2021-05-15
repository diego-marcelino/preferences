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
" Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

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
Plugin 'ryanoasis/vim-devicons'

Plugin 'jiangmiao/auto-pairs'

Plugin 'kiteco/vim-plugin'


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

" -----------------------------------------------
" Go
" -----------------------------------------------
Plugin 'fatih/vim-go'

" -----------------------------------------------
" Docker
" -----------------------------------------------
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'skanehira/docker.vim'
Plugin 'skanehira/docker-compose.vim'

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
hi Comment guifg=#444444
let mapleader=","       " leader is comma
set clipboard=unnamedplus
set tabstop=2
set shiftwidth=2
set expandtab
" Gvim
"set guifont=Cascadia\ Code\ 13
set guifont=Firacode\ 13
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
nnoremap <C-Right>   :vertical resize +1<CR>
nnoremap <C-Left> :vertical resize -1<CR>
nnoremap <C-Up>   :resize +1<CR>
nnoremap <C-Down> :resize -1<CR>


" -----------------------------------------------
" Kite
" -----------------------------------------------
let g:kite_supported_languages = ['*']

" -----------------------------------------------
" vim-airline
" -----------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 0
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
nmap <C-b> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
" let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 10
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <silent> <F3> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ""
let g:NERDTreeDirArrowCollapsible = ""
let g:NERDTreeHijackNetrw=0


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

python3 << EOF
import os
import sys
import subprocess
if "VIRTUAL_ENV" in os.environ:
    project_base_dir = os.environ["VIRTUAL_ENV"]
    script = os.path.join(project_base_dir, "bin/activate")
    pipe = subprocess.Popen(". %s; env" % script, stdout=subprocess.PIPE, shell=True)
    output = pipe.communicate()[0].decode('utf8').splitlines()
    env = dict((line.split("=", 1) for line in output))
    os.environ.update(env)
EOF

" -----------------------------------------------
" Go
" -----------------------------------------------
au BufNewFile,BufRead *.go
    \ set tabstop=4
    \ | set softtabstop=4
    \ | set shiftwidth=4
    \ | set autoindent
    \ | set fileformat=unix


" -----------------------------------------------
" Docker
" -----------------------------------------------
" open browser command, deafult is 'open'
let g:docker_open_browser_cmd = 'open'

" split temrinal windows, can use vert or tab, etc...
" see :h vert
let g:docker_terminal_open = 'bo'

" check plugin's version when plugin loading.
" default is checking.
" If you not want to check, please set 0 to this option.
let g:docker_plugin_version_check = 1

" Set value to 1 can enable using tmux to attach container.
" default value: 0
let g:docker_use_tmux = 1

" this is registry auth info.
" if you want to push an image, please set your auth info.
let g:docker_registry_auth = {
	\ 'username': 'your name',
	\ 'password': 'your password',
	\ 'email': 'your email',
	\ 'serveraddress': 'https://docker.io/',
	\ }

