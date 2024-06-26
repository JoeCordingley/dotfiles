set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'derekwyatt/vim-scala'
Plugin 'derekwyatt/vim-sbt'
Plugin 'rizzatti/dash.vim'
Plugin 'jreybert/vimagit'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'

" The following are examples of different formats supported.
" Keep "Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'jceb/vim-orgmode'
Plugin 'vim-latex/vim-latex'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'windwp/nvim-autopairs'
"Plugin 'tmsvg/pear-tree'

Plugin 'nelstrom/vim-markdown-folding'
Plugin 'vimwiki/vimwiki'
Plugin 'scrooloose/nerdtree'
Plugin 'Chiel92/vim-autoformat'
Plugin 'jalvesaq/Nvim-R'
Plugin 'tpope/vim-surround'
Plugin 'ludovicchabant/vim-gutentags'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'ishan9299/nvim-solarized-lua'

Plugin 'b4b4r07/vim-sqlfmt'
Plugin 'rob-b/gutenhasktags'
Plugin 'andys8/vim-elm-syntax'
Plugin 'dense-analysis/ale'
Plugin 'purescript-contrib/purescript-vim'
"Plugin 'scalameta/nvim-metals'
"Plugin 'nvim-lua/plenary.nvim' 
"Plugin 'hrsh7th/nvim-cmp'
"Plugin 'hrsh7th/cmp-nvim-lsp'
"Plugin 'hrsh7th/cmp-vsnip'
"Plugin 'hrsh7th/vim-vsnip'
"Plugin 'mfussenegger/nvim-dap'


" plugin from http://vim-scripts.org/vim/scripts.html
" "Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" "Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your "Plugins must be added before the following line
call vundle#end()            " required

lua << EOF
require("nvim-autopairs").setup {}
EOF

call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

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

syntax on

set number
set relativenumber
colorscheme solarized
let g:airline_powerline_fonts = 1
set hidden

set guifont=Monaco\ for\ Powerline
set noshowmode
set vb
set clipboard+=unnamed
set guioptions-=r
set guioptions-=L
set wildmenu
set wildignore+=*/target/*
setl autoread
noremap <F5> :Autoformat<CR>
let g:formatdef_scalafmt = "'scalafmt --stdin 2>/dev/null'"
let g:formatters_scala = ['scalafmt']
let g:formatdef_haskellformatter = "'haskell-formatter'"
let g:formatters_haskell = ['haskellformatter']
set guioptions+=c
au BufNewFile,BufRead *.md setlocal ft=vimwiki
au BufNewFile,BufRead *.markdown setlocal ft=vimwiki
:tnoremap <Esc> <C-\><C-n>
" folding
"autocmd Syntax scala setlocal foldmethod=syntax
"autocmd Syntax scala normal zR
set shiftwidth=2
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" redef C-j to C-g
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward
set expandtab

"put swap files in this dir
set directory=.,~/tmp,/var/tmp,/tmp
set statusline+=%{gutentags#statusline()}

let g:gutentags_project_info = [ {'type': 'python', 'file': 'setup.py'},
                               \ {'type': 'ruby', 'file': 'Gemfile'},
                               \ {'type': 'haskell', 'file': 'Setup.hs'} ]
let g:gutentags_ctags_executable_haskell = 'gutenhasktags'
au BufRead,BufNewFile *.elm set filetype=elm

let mapleader=','

" Haskell
nnoremap <leader>t :silent !fast-tags -R .<CR>
nnoremap <leader>T :CtrlPTag<CR>
nnoremap <leader>f :silent !hfmt -w<CR>

" Keybindings

"let g:LanguageClient_serverCommands = {
"  \ 'elm': ['elm-language-server'],
"  \ }
"
"let g:LanguageClient_rootMarkers = {
"  \ 'elm': ['elm.json'],
"  \ }

"lua require('init')

set clipboard=unnamedplus
