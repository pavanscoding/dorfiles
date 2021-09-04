call plug#begin(stdpath('data'))
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'preservim/nerdtree'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'tpope/vim-commentary'
Plug 'trusktr/seti.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'lervag/vimtex'
Plug 'latex-lsp/texlab'
Plug 'voldikss/vim-mma'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
" Plug 'zdharma/fast-syntax-highlighting'
" Plug 'LunarWatcher/auto-pairs'
set spelllang=en_us
call plug#end()
set nocompatible
filetype plugin indent on
filetype plugin on
" let mapleader = "-"
" let maplocalleader = "\\"
set modifiable 
"split navigations
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
set mouse=a "mouse support"
set splitbelow
set splitright
" set clipboard=unnamed
" Enable folding
set foldmethod=indent
set foldlevel=99
set completeopt=menuone,noselect
nnoremap <silent> <esc> :noh<cr><esc>
autocmd FileType tex setlocal spell
au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.css,*.rkt,*.h,*.html,*.tex,*.vim,*.vimrc
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
set encoding=UTF-8

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme = 'lucius'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

highlight Comment cterm=italic gui=italic
set laststatus=2
"set showtabline=2

" true colours

" set t_C=256

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

colorscheme nightfly

set nu rnu " relative line numbering
set clipboard=unnamed " public copy/paste register
set ruler
set showcmd
set noswapfile " does't create swap files
set noshowmode
set shortmess+=c

set backspace=indent,eol,start " let backspace delete over lines
set autoindent " enable auto indentation of lines
set smartindent " allow vim to best-effort guess the indentation
set pastetoggle=<F2> " enable paste mode

" set wildmenu "graphical auto omplete menu
" set lazyredraw "redraws the screne when it needs to
" set showmatch "highlights matching brackets
" set incsearch "search as characters are entered
" set hlsearch "highlights matching searches

"clears highlights
nnoremap // :noh<return>
" moves current line down or up
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP
" open vimrc in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" update changes into current buffer
nnoremap <leader>sv :source $MYVIMRC<cr>
" enable or disable line wrapping in current buffer
nnoremap <buffer> <localleader>w:set wrap!<cr>
"Run code 
augroup compileandrun
    autocmd!
    autocmd filetype cpp nnoremap <buffer> <f7> :w <bar> !g++ -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result %<cr><cr> :vnew <bar> :te ./a.out <cr>i
    autocmd filetype cpp nnoremap <buffer> <f8> :vnew <bar> :te ./a.out <cr>i
    autocmd Filetype python nnoremap <buffer> <f8> :w<CR>:vsplit<cr>:vert ter python3 "%"<CR>i
    autocmd filetype tex nnoremap <buffer> <f8> :w <bar>:VimtexCompile <cr>
    "PDFlatex comes with texlive which is downloaded below so its all good 
    " autocmd filetype tex nnoremap <buffer> <f7> :w <bar>!pdflatex %:r<cr>:w <bar>!asy -noV %:r-*.asy<cr>:w <bar> !pdflatex %:r<cr><cr>:w<cr>
    " autocmd filetype tex nnoremap <buffer> <f7> :w <bar>!latexmk %<cr>:w <bar>!asy -noV %:r-*.asy<cr>:w <bar> !latexmk %:r<cr><cr>:w<cr>
    "if there is an error with the first one, use the bottom one
    " autocmd filetype tex nnoremap <buffer> <f7> :w <bar>!pdflatex %:r<cr>:w <bar>!asy -noV -render=0 %:r-*.asy<cr>:w <bar> !pdflatex %:r<cr><cr>:w<cr>
augroup END
"NerdTree
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
let g:NERDTreeWinSize=60
" set guifont=DroidSansMono\ Nerd\ Font\ Complete\ Mono\ 11
let g:airline_powerline_fonts = 1
"If I go to a different file in a different directory, the working directory
"is the one I changed 
set autochdir 
let g:NERDTreeUseSimpleIndicator = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
autocmd FileType nerdtree setlocal nolist

let g:NERDTreeGitStatusWithFlags = 1
 
"Make sure you download latex
"sudo apt install texlive-full
"Also download latexmk which is downloaded using "sudo apt-get install latexmk"

"Latex Config
let g:vimtex_quickfix_enabled = 0
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
" let g:vimtex_latexmk_continuous = 1
 let g:vimtex_compiler_latexmk = {
        \ 'continuous' : 1,
        \}
let g:vimtex_compiler_progname = 'nvr'
" use skim if you are on Mac
" zathura can be downloaded on latex with the command 'sudo apt install zathura'
let g:vimtex_view_method = 'zathura'

"switch back to this one later when it is fixed
au FileType tex let b:AutoPairs = AutoPairsDefine({'$':'$'})
" let g:AutoPairs = autopairs#AutoPairsDefine([{'open': '\\[', 'close': '\]', 'filetype': 'tex'}])

"Vim auto save
"If vim starts to get slow, change the autosave_seconds value higher
" Save on lost focus/exit 
" autocmd FocusLost,VimLeavePre,TextChangedI,InsertLeave,CursorHoldI * silent! w
" Also, save 3 times per second if there are changes
" let g:autosave_seconds = 0.3 
" au BufRead,BufNewFile * let b:start_time=localtime()
" au CursorHold * silent! call UpdateFile()
" function! UpdateFile()
"   if ((localtime() - b:start_time) >= g:autosave_seconds)
"     update
"     let b:start_time=localtime()
"   endif
" endfunction
" au BufWritePre * let b:start_time=localtime()
"Control V is past in vim 

" use omni completion provided by lsp
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc
