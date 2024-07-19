"let mapleader = ","
let mapleader = "\<Space>"
set history=200         " keep 100 lines of history
set ruler               " show the cursor position
set number                     " Show current line number
set relativenumber                " show relative line numbers
set showmatch                     " show bracket matches
syntax on               " syntax highlighting
" set hlsearch            " highlight the last searched term
set incsearch
set ignorecase
set smartcase           "If captital search by case sensitive
set splitbelow          " set default split to below  mostly for quickfix
" set t_Co=256
" set background=dark
let g:impact_transbg=1

set colorcolumn=+1
set textwidth=100
set formatoptions-=t " Stop bracking the lines at the limit
set wrapmargin=0

autocmd FileType gitcommit setlocal spell
" autocmd BufRead *.md :Goyo 80

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Copy to keyboard
" @todo Need a better key map here
" xnoremap yy :w !pbcopy<CR><CR> 
xnoremap yy "*y
" Unmap the arroul keys in nomal mode
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" set listchars=eol:¬,trail:·,tab:»·
set list
set nocompatible              " be iMproved, required

" Dictionary complete
inoremap <C-D> <C-X><C-K>
autocmd FileType markdown set spell

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'nvim-tree/nvim-web-devicons' " optional
Plugin 'nvim-tree/nvim-tree.lua'

Plugin 'crusoexia/vim-monokai'
" Plugin 'xiyaowong/nvim-transparent'
" let g:transparent_enabled = v:true
"set termguicolors
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'sedm0784/vim-you-autocorrect'
Plugin 'kristijanhusak/vim-carbon-now-sh'
" Use release branch (Recommend)
" To run rust  rustup component add rls rust-analysis rust-src
" :CocInstall coc-rls
" Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" nmap <leader>a <Plug>(coc-codeaction)<CR>
" xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
map <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
xmap <silent> <leader>r   <cmd>lua vim.lsp.buf.code_action()<CR>
" Plugin 'neovim/nvim-lspconfig'
" Plugin 'neovim/nvim-lspconfig'
" Plugin 'nvim-lua/completion-nvim'

Plugin 'vim-scripts/DrawIt'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Test
Plugin 'mateusfreira/vim-test'
" let test#strategy = "neovim"

" Yank highlight 
Plugin 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 500

"Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_section_y = ''
let g:airline_section_b = ''
let g:airline_theme = 'sol'

" Code completion
" Plugin 'Shougo/deoplete.nvim'
"let g:deoplete#auto_complete_delay = 50
"let g:deoplete#num_processes = 8

" Required for  deoplete
" Plugin 'roxma/nvim-yarp'
" Plugin 'roxma/vim-hug-neovim-rpc'
" Plugin 'carlitux/deoplete-ternjs'
" let g:deoplete#enable_at_startup = 1

" Vim enhancements
Plugin 'terrastruct/d2-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" Plugin 'scrooloose/nerdtree'
" Let nerdtree like textmake
" let g:NERDTreeWinPos = "right" 


" Snipets
"
"
"
"Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'

" Javascript
Plugin 'leafgarland/typescript-vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'pangloss/vim-javascript'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'folke/tokyonight.nvim'


"Jenkins
au BufNewFile,BufRead jenkinsfile setf groovy 
Plugin 'sheerun/vim-polyglot'


"Git util
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
Plugin 'sainnhe/gruvbox-material'
Plugin 'catppuccin/nvim', { 'as': 'catppuccin' }


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

"Sum numbers
Plugin 'emugel/vim-sum'
"nmap <Leader>a <Plug>VimSumOperatorPending
"vmap <Leader>a <Plug>VimSumVisual

" Markdown
" Plugin 'godlygeek/tabular'
" Plugin 'preservim/vim-markdown'
Plugin 'instant-markdown/vim-instant-markdown'
let g:instant_markdown_autostart=0
let g:instant_markdown_mermaid = 1
" Plugin 'shime/vim-livedown'
" Vim Script
" Plugin 'folke/zen-mode.nvim'
Plugin 'Pocco81/true-zen.nvim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
" noremap <leader>l :Goyo 36<CR>
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!
" autocmd BufRead *.md :Goyo 80
" autocmd BufNewFile _posts/*.md :Goyo 36
" GO to file in markdown
autocmd FileType markdown noremap <leader>g yi[:edit <C-R>"<cr>
autocmd FileType markdown xmap <leader>e :'<,'>w !node<cr>

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
" Plugin 'w0rp/ale'
let g:ale_linters = {
\   'javascript': ['eslint'], 'typescript': ['tslint', 'tsserver'],
\   'markdown':      ['mdl', 'writegood'],
\}
let g:ale_fixers = {
            \   '*':          ['remove_trailing_lines', 'trim_whitespace'],
            \}
"let g:ale_linters_ignore = {'typescript': ['tslint']}

nnoremap <leader>d <Plug>(coc-definition)
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

Plugin 'dennougorilla/azuki.vim'

" Org mode
Plugin 'jceb/vim-orgmode'
Plugin 'wsdjeg/vim-fetch'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


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
autocmd FileType typescript map <leader>f :call JsBeautify()<cr>
" autocmd FileType typescript map <leader>f :w<CR>:!JsBeautify() -r %<cr>
autocmd FileType go map <leader>f :!go fmt %<cr>

noremap <leader>g :ALEGoToDefinition<cr>

map <leader>o :NvimTreeToggle<cr>
map <leader>i :NvimTreeFindFile<cr>

:inoremap <F5> <C-R>=strftime("%c")<CR>
:nnoremap <F5> "=strftime("%c")<CR>P

nmap <leader>q :on<cr>
" autocmd FileType javascript nmap <leader>t :call RunNearestTest()<cr>
autocmd FileType javascript nmap <leader>t :TestNearest<CR>
autocmd FileType typescript nmap <leader>t :TestNearest<CR>
autocmd FileType typescript nmap <leader>l :TestLast<CR>
autocmd FileType javascript nmap <leader>l :TestLast<CR>
" Review files
nmap <leader>k :let @*=fnamemodify(expand("%"), ":~:.").":".line('.')<cr>:edit todo.md<cr>Go[ ]<Esc>hi
" Upload last image from desktop
nmap <leader>u  o![](<Esc>:r !~/upload-last-image.sh<CR>kJxA)<esc>0F<space>x
nmap <leader>n  :call ChooseDocument()<cr>

" Reference the last visit file
nmap <leader>p  o[<Esc>"#pA]<Esc>

autocmd FileType cucumber nmap <leader>t :w<CR>:!npm run bdd:ui:file -- %<CR>

function! Wait()
    sleep 200m
endfunction

autocmd FileType rust nmap <leader>t :TestNearest<CR>
autocmd FileType rust nmap <leader>l :TestLast<CR>

autocmd FileType python nmap <leader>t :TestNearest<CR>
autocmd FileType python nmap <leader>l :TestLast<CR>

nmap <leader>y :call RunTestFile()<cr>
autocmd FileType rust nmap <leader>y :!cargo test<cr>

autocmd FileType javascript nmap <leader>e :w<CR>:!node_modules/.bin/eslint % --fix <cr>
autocmd FileType typescript nmap <leader>e :w<CR>:!node_modules/.bin/eslint % --fix <cr>
" autocmd FileType typescript nmap <leader>e :w<CR>:!node_modules/.bin/tslint -p tsconfig.json % <cr>
autocmd FileType rust nmap <leader>e :w<CR>:!cargo fmt <cr>
" Exec the current line as a command
autocmd FileType markdown nmap <leader>e :exec 'r!'.getline('.')<CR>


"Run current file
autocmd FileType javascript nmap <leader>r :w<CR>:!node --inspect %  <cr>
" autocmd FileType python nmap <leader>r :w<CR>:!python3  % <cr>
autocmd FileType go nmap <leader>r :w<CR>:!go run  %<cr>
autocmd FileType rust nmap <leader>r :w<CR>:!cargo build<cr>
autocmd FileType markdown nmap <leader>r :w<CR>:InstantMarkdownPreview<cr>
" autocmd FileType markdown vmap <leader>r :'<,'>:w !espeak -v en-gb<cr>

"Shows the console :)
nmap <leader>v :!pwd <cr>

" Fix list moving
" Move to the next error
nnoremap <leader>cn :cn<CR>zz
" Move to the previous error
nnoremap <leader>cp :cp<CR>zz

" In code maps
autocmd FileType javascript nnoremap <Leader>c viwyoconsole.log();<Esc>hhp0f(lv$hhh
autocmd FileType typescript nnoremap <Leader>c viwyoconsole.log();<Esc>hhp0f(lv$hhh
autocmd FileType javascript nnoremap <Leader>x :call let @*=fnamemodify(expand("%"), ":~:.").":".line('.')
" autocmd FileType javascript nnoremap <Leader>a viwyoconsole.log();<Esc>hhp
autocmd FileType tex nnoremap <Leader>a ciw\ac{}<Esc>hp
"Save current file
nmap <leader>w :w<CR>


set backspace=indent,eol,start
"Ser current directory to create file


function! RunTests(filename, complement)
  :w
  :silent !clear
  let in_testcafe_file = match(a:filename, '\(testcafe.*\)$') != -1
  if(in_testcafe_file)
    if(a:complement == "")
        exec ":!./node_modules/.bin/testcafe 'chrome' ".a:filename
"   exec ":!./node_modules/.bin/testcafe 'chrome:headless' ".a:filename
   else 
        exec ":!./node_modules/.bin/testcafe 'chrome' ".a:filename." -t ".a:complement
    endif
  else
    exec ":!./node_modules/.bin/jest ".a:filename." -t ".a:complement
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
	let in_test_file = match(expand("%"), '\(testcafe.*\|spec.*\|test.*\)$') != -1
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
  let descPattern = '\v<(it|describe|context|test)\s*\(?\s*[''"](.*)[''"]\s*,'
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


" colorscheme gruvbox
" colorscheme solarized
" colorscheme dracula
" colorscheme monokai
"colorscheme gruvbox-material
" colorscheme darkblue
" colorscheme tokyonight-storm
" colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
colorscheme tokyonight-night
" colorscheme tokyonight-storm
" colorscheme tokyonight-day
" colorscheme tokyonight-moon
" let g:lightline = {'colorscheme': 'tokyonight-day'}
" let g:lightline = {'colorscheme': 'tokyonight-moon'}

autocmd FileType tex set textwidth=0
autocmd FileType markdown set textwidth=0

" Nvim
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" Nvim
lua require('plugins')
lua require('chatgpt').setup()


" Mouse
set mouse=
autocmd TermOpen * startinsert

function! NewTask()
  let name = input('Enter Task name: ', "")
  exec "e `./new-task.sh '" . name . "'`"
endfunction
function! NewProblem()
  let name = input('Enter Problem name: ', "")
  exec "e `./new-problem.sh '" . name . "'`"
endfunction
function! NewMeeting()
  let name = input('Enter Meeting name: ', "")
  exec "e `./new-meeting.sh '" . name . "'`"
endfunction

function! NewDay()
  exec "e `./new-day.sh`"
endfunction

function! ChooseDocument()
  let doc_kind = inputlist(['What document?', '1. Day', '2. Meeting', '3. Problem', '4. Task'])
  if doc_kind == 1
    call NewDay()
  elseif doc_kind == 2
    call NewMeeting()
  elseif doc_kind == 3
    call NewProblem()
  elseif doc_kind == 4
    call NewTask()
  endif
endfunction
"  nmap <leader>n  :call ChooseDocument()<cr>
