set history=100         " keep 100 lines of history
 set ruler               " show the cursor position
 syntax on               " syntax highlighting
 set hlsearch            " highlight the last searched term
 filetype plugin on      " use the file type plugins
set runtimepath^=~/.vim/bundle/ctrlp.vim
" :calil pathogen#infect()
set number
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>
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
Plugin 'fweep/vim-tabber'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
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
"map <leader>fl :call RangeJsBeautify()<cr>
"map <c-f> :call JsBeautify()<cr>
map <c-f> :call RangeJsBeautify()<cr>
let mapleader = ","
map <leader>f :call JsBeautify()<cr>
nmap <leader>ne :NERDTreeToggle<cr>
map <c-o> :NERDTree<cr>
nmap <leader>t :w<CR>:!NODE_ENV=codeship mocha %<cr>
nmap <leader>r :w<CR>:!node  %<cr>
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

set guioptions-=e
set tabline=%!tabber#TabLine()
let g:tabber_wrap_when_shifting = 1
let g:tabber_wrap_when_shifting = 1
if !has('gui_running')
  set t_Co=256
endif
set backspace=indent,eol,start
"Ser current directory to create file
set autochdir
"Desable the search hl on the insert mode
let didit = 0
autocmd! InsertEnter * if ! didit | call feedkeys("\<C-\>\<C-o>:nohlsearch|let didit = 1\<CR>", 'n') | endif
autocmd! InsertLeave * let didit = 0

" Silver search
let g:ag_working_path_mode="r"
map <leader>s :Ag!<space>
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
