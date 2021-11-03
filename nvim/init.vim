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
Plug 'ryanoasis/powerline-extra-symbols'
" Plug 'natebosch/vim-lsc'
" let g:lsc_server_commands = {'tex': 'texlab'}
" let g:lsc_enable_autocomplete = v:false
" let g:lsc_auto_map = v:true

" " Apply the defaults with a few overrides:
" let g:lsc_auto_map = {'defaults': v:true, 'FindReferences': '<leader>r'}

" " Setting a value to a blank string leaves that command unmapped:
" let g:lsc_auto_map = {'defaults': v:true, 'FindImplementations': ''}

" " ... or set only the commands you want mapped without defaults.
" " Complete default mappings are:
" let g:lsc_auto_map = {
"     \ 'GoToDefinition': '<C-]>',
"     \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
"     \ 'FindReferences': 'gr',
"     \ 'NextReference': '<C-n>',
"     \ 'PreviousReference': '<C-p>',
"     \ 'FindImplementations': 'gI',
"     \ 'FindCodeActions': 'ga',
"     \ 'Rename': 'gR',
"     \ 'ShowHover': v:true,
"     \ 'DocumentSymbol': 'go',
"     \ 'WorkspaceSymbol': 'gS',
"     \ 'SignatureHelp': 'gm',
"     \ 'Completion': 'completefunc',
"     \}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'joom/latex-unicoder.vim'
" ALE + CoC
let g:coc_status_error_sign = '--'
let g:coc_status_warning_sign = '>>'
" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '>>'
" " let g:ale_sign_warning = '⚠'
" let g:ale_sign_warning='--'
" let g:ale_echo_msg_error_str = ' >> '
" " let g:ale_echo_msg_warning_str = ' ⚠ ' 
" let g:ale_echo_msg_warning_str='--'
" let g:ale_echo_msg_format = '[%severity%] %s'
" let g:ale_disable_lsp = 1
" let g:ale_linters = {'python': []}
" " let g:ale_linters = {'tex': ['texlabs']}
let g:coc_global_extensions = [
        \ 'coc-pyright',
        \ 'coc-texlab',
        \ 'coc-clangd',
        \ 'coc-sh',
        \ 'coc-lsp-wl'
        \ ]
" Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'tpope/vim-commentary'
Plug 'trusktr/seti.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'lervag/vimtex'
Plug 'latex-lsp/texlab'
Plug 'voldikss/vim-mma'
Plug 'metakirby5/codi.vim'
" Plug 'zdharma/fast-syntax-highlighting'
" Plug 'LunarWatcher/auto-pairs'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'jdhao/better-escape.vim'
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
nnoremap <silent> <esc> :noh<cr><esc>
autocmd FileType tex setlocal spell
au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.css,*.rkt,*.h,*.html,*.tex,*.vim,*.vimrc
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=200000 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set linebreak
set encoding=UTF-8

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme = 'lucius'
" let g:airline_theme = 'nightfly'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#coc#enabled = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
  " let g:airline_symbols.spell = 'Ꞩ'
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.maxlinenr = '   '
let g:airline_symbols.linenr = '   '
let g:airline_symbols.colnr = '  '
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
let g:airline_symbols.readonly = ''

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
" Fixes wrapped line issues
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <expr> $ v:count ? '$' : 'g$'
nnoremap <expr> ^ v:count ? '^' : 'g^'
nnoremap <expr> 0 v:count ? '0' : 'g0'
set breakindent
set wrapmargin=1
set formatoptions+=t
set formatoptions-=l
" clears highlights
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
    " autocmd filetype cpp nnoremap <buffer> <f7> :w <bar> !g++ -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result % <cr>
    autocmd filetype cpp nnoremap <buffer> <f7> :w<cr>:vsplit<cr>:vert ter g++ -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result "%"<cr>i 
    autocmd filetype cpp nnoremap <buffer> <f8> :vnew <bar> :te ./a.out <cr>i
    autocmd Filetype python nnoremap <buffer> <f8> :w<CR>:vsplit<cr>:vert ter python3 "%"<CR>i
    autocmd filetype tex nnoremap <buffer> <f8> :w <bar>:VimtexCompile <cr>
    " autocmd filetype tex nnoremap <buffer> <f7> :w <bar>!latexmk %<cr>:w <bar>!asy -noV %:r-*.asy<cr>:w <bar> !latexmk %:r<cr><cr>:w<cr>
    "if there is an error with the first one, use the bottom one
    " autocmd filetype tex nnoremap <buffer> <f7> :w <bar>!latexmk %:r<cr>:w <bar>!asy -noV -render=0 %:r-*.asy<cr>:w <bar> !latexmk %:r<cr><cr>:w<cr>
augroup END
"Python autocomplete
let g:python3_host_prog='/usr/bin/python3'
"reverse the order of coc.nvim 
let g:SuperTabDefaultCompletionType = "<c-n>"
"coc.nvim setup
" Set internal encoding of vim, not needed n neovim, since coc.nvim using some
" unicode character in the file autoload/float.vim

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>o
let g:coc_snippet_next = ','
let g:coc_snippet_prev = '^'
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
let g:NERDTreeWinSize=40
set guifont=DroidSansMono\ Nerd\ Font\ Complete\ Mono\ 11
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
"Wolfram alpha set up
let g:better_escape_interval = 200
let g:better_escape_shortcut = 'fd'


