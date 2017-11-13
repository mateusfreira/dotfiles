set history=100         " keep 100 lines of history
 set ruler               " show the cursor position
 syntax on               " syntax highlighting
 set hlsearch            " highlight the last searched term
 filetype plugin on      " use the file type plugins
set runtimepath^=~/.vim/bundle/ctrlp.vim
call pathogen#infect()
set number
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nmap <leader>l :set list!<CR>
set listchars=eol:¬,trail:·,tab:»·
set list
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mhinz/vim-signify'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'
Plugin 'Valloric/YouCompleteMe'
Plugin 'lervag/vimtex'
Plugin 'wakatime/vim-wakatime'
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
" Put your non-Plugin stuff after this linekkk
map <c-f> :call RangeJsBeautify()<cr>
let mapleader = ","
nmap <leader>ne :NERDTree<cr>
map <c-o> :NERDTree<cr>
set laststatus=2
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules     " MacOSX/Linux
set statusline+=%F



" ctrp-p
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }
let g:ctrlp_clear_cache_on_exit = 0

