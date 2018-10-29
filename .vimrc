let mapleader = ","
set history=100         " keep 100 lines of history
set ruler               " show the cursor position
set relativenumber                " show relative line numbers
set showmatch                     " show bracket matches
syntax on               " syntax highlighting
" set hlsearch            " highlight the last searched term
set incsearch
"set runtimepath^=~/.vim/bundle/ctrlp.vim
" :calil pathogen#infect()

"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

noremap <leader>l :set list!<CR>
set listchars=eol:¬,trail:·,tab:»·
set list
set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'carlitux/deoplete-ternjs'
let g:deoplete#enable_at_startup = 1

Plugin 'VundleVim/Vundle.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'leafgarland/typescript-vim'
Plugin 'mhinz/vim-signify'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-repeat'
Plugin 'itchyny/vim-gitbranch'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plugin 'lervag/vimtex'
let g:tex_flavor='latex' " Avoid plaintex filetype for .tex files
Plugin 'wakatime/vim-wakatime'
Plugin 'scrooloose/nerdtree'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'rking/ag.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'JKirchartz/writegooder.vim'
Plugin 'editorconfig/editorconfig-vim'
"Plugin 'donRaphaco/neotex', { 'for': 'tex' } 
Plugin 'dennougorilla/azuki.vim'
Plugin 'morhetz/gruvbox'
Plugin 'elixir-editors/vim-elixir'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf

"Plugin 'vim-syntastic/syntastic'
"" Drop Syntastic settings at the end of the config file "
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
""let g:syntastic_javascript_eslint_exe = 'eslint . --'
"
"let g:syntastic_mode_map={'mode': 'passive'}

Plugin 'w0rp/ale'
"let b:ale_linters = {'javascript': ['eslint']}


nnoremap <leader>d :ALEToggle<CR>
nnoremap ; :
nnoremap <C-b> :Buffers<CR>
nnoremap <C-g>g :Ag<CR>
nnoremap <C-g>c :Commands<CR>
nnoremap <C-f>l :BLines<CR>
nnoremap <C-p> :GFiles<CR>﻿
nnoremap <C-t> :Tags<CR>﻿
 


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype off                  " required
filetype plugin indent on    " required
set smarttab
set cindent
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
:inoremap <F5> <C-R>=strftime("%c")<CR>
:nnoremap <F5> "=strftime("%c")<CR>P
"nnoremap <Leader>c oconsole.log();<Esc>hi
nnoremap <Leader>c viWyoconsole.log();<Esc>hhp0f(lv$hhh
autocmd FileType javascript nnoremap <Leader>a viwyoconsole.log();<Esc>hhp
autocmd FileType tex nnoremap <Leader>a ciw\ac{}<Esc>hp
map <F5> :
map <c-f> :call RangeJsBeautify()<cr>
map <leader>f :call JsBeautify()<cr>
nmap <leader>ne :NERDTreeToggle<cr>
"map <c-o> :NERDTreeToggle<cr>
map <leader>o :NERDTreeToggle<cr>

"nmap <leader>t :w<CR>:!NODE_ENV=codeship mocha %<cr>
nmap <leader>q :on<cr>
nmap <leader>t :call RunNearestTest()<cr>
nmap <leader>y :call RunTestFile()<cr>
autocmd FileType javascript nmap <leader>r :w<CR>:!TENFOLD_CONFIG_NAME=production node --inspect % --run<cr>
autocmd FileType javascript nmap <leader>e :w<CR>:!eslint % --fix<cr>
autocmd FileType python nmap <leader>r :w<CR>:!python3  % --run<cr>
nmap <leader>v :!pwd<cr>
"Shows the console :)
nmap <leader>w :w<CR>
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
set backspace=indent,eol,start
"Ser current directory to create file
"set autochdir

"Desable the search hl on the insert mode
"let didit = 0
"autocmd! InsertEnter * if ! didit | call feedkeys("\<C-\>\<C-o>:nohlsearch|let didit = 1\<CR>", 'n') | endif
"autocmd! InsertLeave * let didit = 0

" Silver search
let g:ag_working_path_mode="r"
map <leader>s :Ag!<space>
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
function! RunTests(filename, complement)
  :w
  :silent !clear
 exec ":!NODE_ENV=codeship TENFOLD_DIFF_CALL_ARRAYS=true node --inspect ./node_modules/mocha/bin/mocha ".a:filename." ".a:complement
"exec ":!echo ".a:filename." ".a:complement
endfunction
" Thanks https://github.com/chrishunt
function! SetTestFile()
   "set the spec file that tests will be run for.
  " let g:grb_test_file=@% " Use the window scope project relative
  let g:grb_test_file=expand('%:p')
endfunction

function! RunTestFile(...)
	" run the tests for the previously-marked file.
	let in_test_file = match(expand("%"), '\(spec.js\|test.js\)$') != -1
	if in_test_file
	   call SetTestFile()
	elseif !exists("g:grb_test_file")
  		return
	end
	call RunTests(g:grb_test_file, "")
endfunction



function! GetNearestTest()
  let callLine = line (".")           "cursor line
  let file = readfile(expand("%:p"))  "read current file
  let lineCount = 0                   "file line counter
  let lineDiff = 999                  "arbituary large number
  let descPattern = '\v<(it|describe|context)\s*\(?\s*[''"](.*)[''"]\s*,'
  for line in file
    let lineCount += 1
    let match = match(line,descPattern)
    if(match != -1)
      let currentDiff = callLine - lineCount
      " break if closest test is the next test
      if(currentDiff < 0 && lineDiff != 999)
        break
      endif
      " if closer test is found, cache new nearest test
      if(currentDiff <= lineDiff)
        let lineDiff = currentDiff
        let g:nearestTest = substitute(matchlist(line,descPattern)[2],'\v([''"()])','(.{1})','g')
      endif
    endif
  endfor
endfunction

function! RunNearestTest(...)
	" run the tests for the previously-marked file.
	let in_test_file = match(expand("%"), '\(spec.js\|test.js\)$') != -1
	if in_test_file
		call SetTestFile()
   		call GetNearestTest()
	elseif !exists("g:grb_test_file") 
  		return
	elseif !exists("g:nearestTest") 
		return
	end
	call RunTests(g:grb_test_file, " -g '".g:nearestTest."'")
endfunction
" auto reload after 4 seconds in coursor stop
au CursorHold,CursorHoldI * checktime
" Tags configs

set tags+=tags;/
nnoremap <leader>. :CtrlPTag<cr>
"Sniped plugin
"
"
"
" Track the engine.
 Plugin 'SirVer/ultisnips'
 " Snippets are separated from the engine. Add this if you want them:
 Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab>
"let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" set dark background and color scheme
"let NERDTreeMapOpenInTab='<ENTER>'
"set background=dark
set rtp+=$HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
set number


"au BufReadPost,BufNewFile *.md,*.txt,*.tex WritegooderEnable

colorscheme gruvbox
set background=dark
autocmd FileType gitcommit setlocal spell








