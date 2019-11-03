"let mapleader = ","
let mapleader = "\<Space>"
set history=200         " keep 100 lines of history
set ruler               " show the cursor position
set number                     " Show current line number
"set relativenumber                " show relative line numbers
set showmatch                     " show bracket matches
syntax on               " syntax highlighting
" set hlsearch            " highlight the last searched term
set incsearch
set t_Co=256
set background=dark
set colorcolumn=+1
set textwidth=120
autocmd FileType tex set textwidth=0
set wrapmargin=0

autocmd FileType gitcommit setlocal spell

" Unmap the arroul keys in nomal mode
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

noremap <leader>l :set list!<CR>
set listchars=eol:¬,trail:·,tab:»·
set list
set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_section_y = ''
let g:airline_section_b = ''
let g:airline_theme = 'sol'

" Code completion
"Plugin 'Shougo/deoplete.nvim'
"let g:deoplete#auto_complete_delay = 50
"let g:deoplete#num_processes = 8

" Required for  deoplete
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'carlitux/deoplete-ternjs'
let g:deoplete#enable_at_startup = 1

" Vim enhancements
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdtree'
" Let nerdtree like textmake
let g:NERDTreeWinPos = "right" 


" Snipets
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Javascript
Plugin 'leafgarland/typescript-vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'pangloss/vim-javascript'
Plugin 'editorconfig/editorconfig-vim'


" Git util
Plugin 'mhinz/vim-signify'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"
" Latex
Plugin 'lervag/vimtex'
let g:tex_flavor='latex' " Avoid plaintex filetype for .tex files

" Trakers
Plugin 'wakatime/vim-wakatime'

" Themes
Plugin 'morhetz/gruvbox'
Plugin 'dracula/vim'
Plugin 'altercation/vim-colors-solarized'

" Elixir
Plugin 'elixir-editors/vim-elixir'

" Elm
Plugin 'elmcast/elm-vim'
let g:elm_format_autosave = 1


"Rust 
Plugin 'rust-lang/rust.vim'

"Typescript
Plugin 'heavenshell/vim-jsdoc'
"Plugin 'Quramy/tsuquyomi'


"Fuzzy search
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf
nnoremap <C-b> :Buffers<CR>
nmap <leader>; :Buffers<CR>
nnoremap <C-g>g :Ag<CR>
nnoremap <C-g>c :Commands<CR>
nnoremap <C-f>l :BLines<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-t> :Tags<CR>
map <leader>s :Ag!<space>
nnoremap <leader><leader> <c-^>

"Code style checking
Plugin 'w0rp/ale'
let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['tslint', 'tsserver']}
"let g:ale_linters_ignore = {'typescript': ['tslint']}

nnoremap <leader>d :ALEToggle<CR>

Plugin 'dennougorilla/azuki.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype off                  " required
filetype plugin indent on    " required
set smarttab
set cindent

"Hot keys
nnoremap ; :
map <c-f> :call RangeJsBeautify()<cr>
autocmd FileType javascript map <leader>f :call JsBeautify()<cr>
autocmd FileType typescript map <leader>f :w<CR>:!tsfmt -r %<cr>
autocmd FileType go map <leader>f :!go fmt %<cr>
nmap <leader>ne :NERDTreeToggle<cr>
map <leader>o :NERDTreeToggle<cr>

:inoremap <F5> <C-R>=strftime("%c")<CR>
:nnoremap <F5> "=strftime("%c")<CR>P

nmap <leader>q :on<cr>
nmap <leader>t :call RunNearestTest()<cr>
nmap <leader>y :call RunTestFile()<cr>
autocmd FileType javascript nmap <leader>e :w<CR>:!node_modules/.bin/eslint % --fix <cr>
autocmd FileType typescript nmap <leader>e :w<CR>:!node_modules/.bin/tslint -p tsconfig.json % <cr>
"Run current file
autocmd FileType javascript nmap <leader>r :w<CR>:!TENFOLD_CONFIG_NAME=production node --inspect % --run <cr>
autocmd FileType python nmap <leader>r :w<CR>:!python3  % --run <cr>
autocmd FileType go nmap <leader>r :w<CR>:!go run  %<cr>
autocmd FileType rust nmap <leader>r :w<CR>:!cargo build<cr>

"Shows the console :)
nmap <leader>v :!pwd <cr>

" In code maps
autocmd FileType javascript nnoremap <Leader>c viWyoconsole.log();<Esc>hhp0f(lv$hhh
autocmd FileType javascript nnoremap <Leader>a viwyoconsole.log();<Esc>hhp
autocmd FileType tex nnoremap <Leader>a ciw\ac{}<Esc>hp
"Save current file
nmap <leader>w :w<CR>
nmap <leader>e :!tmux new -d "livedown start % --port 4242"&&echo "Started livedown in the backgound 4242"<CR>

set backspace=indent,eol,start
"Ser current directory to create file


function! RunTests(filename, complement)
  :w
  :silent !clear
  let in_ts_file = match(a:filename, '\(.ts\)$') != -1
  if(in_ts_file)
    exec ":!jest --config ./jest.server.config.js ".a:filename." -t ".a:complement
  else
    exec ":!NODE_ENV=codeship node ./node_modules/mocha/bin/mocha ".a:filename." -g ".a:complement
  endif
endfunction
" Thanks https://github.com/chrishunt
function! SetTestFile()
   "set the spec file that tests will be run for.
  " let g:grb_test_file=@% " Use the window scope project relative
  let g:grb_test_file=expand('%:p')
endfunction

function! RunTestFile(...)
	" run the tests for the previously-marked file.
	let in_test_file = match(expand("%"), '\(spec.*\|test.*\)$') != -1
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
	let in_test_file = match(expand("%"), '\(spec.*\|test.*\)$') != -1
	if in_test_file
		call SetTestFile()
   		call GetNearestTest()
	elseif !exists("g:grb_test_file") 
  		return
	elseif !exists("g:nearestTest") 
		return
	end
	call RunTests(g:grb_test_file, " '".g:nearestTest."'")
endfunction
" auto reload after 4 seconds in coursor stop
au CursorHold,CursorHoldI * checktime
" Tags configs

set tags+=tags;/
nnoremap <leader>. :CtrlPTag<cr>



colorscheme gruvbox
"colorscheme solarized
"colorscheme dracula
"colorscheme darkblue
