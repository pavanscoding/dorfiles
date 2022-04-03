function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function xmap(shortcut, command)
  map('x', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

vim.opt.compatible=false
vim.cmd([[
    filetype plugin indent on
    filetype plugin on
]])

vim.opt.modifiable=true
vim.opt.mouse="a" --mouse clicks
vim.opt.splitbelow=true
vim.opt.splitright=true

-- enable line folding
vim.opt.foldmethod="indent"
vim.opt.foldlevel=99

nmap("<silent> <esc>", ":noh<cr><esc>")

-- Default file settings
vim.cmd([[
autocmd FileType tex setlocal spell
au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.css,*.rkt,*.h,*.html,*.tex,*.vim,*.vimrc,*.json,*.lua
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=200000 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set linebreak
highlight Comment cterm=italic gui=italic
]])
vim.opt.encoding="UTF-8"
vim.opt.laststatus=2
vim.opt.termguicolors=true

vim.$NVIM_TUI_ENABLE_TRUE_COLOR=1

vim.g.tokyonight_style="night"
vim.cmd(colorscheme nightfly)

vim.opt.nu=true
vim.opt.rnu=true
vim.opt.clipboard=vim.opt.clipboard+"unnamedplus"
vim.opt.ruler=true
vim.opt.showcmd=true
vim.opt.swapfile=false
vim.opt.showmode=false
vim.opt.shortmess=vim.opt.shortmess+"c"

vim.opt.backspace="indent,eol,start"
vim.opt.autoindent=true
vim.opt.smartindent=true
vim.opt.pastetoggle="<F2>"

-- Fixes wrapped line issues
vim.cmd([[
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <expr> $ v:count ? '$' : 'g$'
nnoremap <expr> ^ v:count ? '^' : 'g^'
nnoremap <expr> 0 v:count ? '0' : 'g0'
]])

vim.opt.breakindent=true
vim.opt.wrapmargin=1
vim.opt.formatoptions=vim.opt.formatoptions+"t"
vim.opt.formatoptions=vim.opt.formatoptions-"l"

-- clears highlights
nmap("//",":noh<return>")
-- moves current line up or down
nmap("<leader>-","ddp")
nmap("<leader>_","ddkP")
-- opens $VIMRC in a vertical split
nmap("<leader>ev",":vsplit $MYVIMRC<cr>")
-- update changes into current buffer
nmap("<leader>sv",":source $MYVIMRC<cr>")

-- Runs code
vim.cmd([[
autocmd!
    " C++
    autocmd filetype cpp nnoremap <buffer> <f3> :w<cr>:vsplit<cr>:vert ter g++ -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result "%"<cr>i 
    autocmd filetype cpp nnoremap <buffer> <f4> :vnew <bar> :te ./a.out <cr>i
   autocmd filetype cpp nnoremap <buffer> <F8> :w <bar>!g++ -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result "%"<cr> :vnew <bar> :te ./a.out <cr><cr>i
    " autocmd filetype cpp nnoremap <buffer> <F8> :CompetitestRun <cr>
    "Python 
    autocmd Filetype python nnoremap <buffer> <f8> :w<CR>:vsplit<cr>:vert ter python3 "%"<CR>i
    "Latex
    autocmd filetype tex nnoremap <buffer> <f8> :w <bar>:VimtexCompile <cr>
    " autocmd filetype tex nnoremap <buffer> <f7> :w <bar>!latexmk %<cr>:w <bar>!asy -noV %:r-*.asy<cr>:w <bar> !latexmk %:r<cr><cr>:w<cr>
    "if there is an error with the first one, use the bottom one
    " autocmd filetype tex nnoremap <buffer> <f7> :w <bar>!latexmk %:r<cr>:w <bar>!asy -noV -render=0 %:r-*.asy<cr>:w <bar> !latexmk %:r<cr><cr>w<cr>
    " Java
     autocmd filetype java nnoremap <buffer> <f3> :w<cr>:vsplit<cr>:vert ter javac "%"<cr>i 
     " autocmd filetype java nnoremap <buffer> <f4> :vnew <bar> :te java "%:h" <cr>i
     autocmd filetype java nnoremap <buffer> <f4> :!java -cp %:p:h %:t:r <cr> i
     autocmd filetype java nnoremap <buffer> <F8> :w <bar>!javac "%"<cr> :vnew <bar> :te java "%:h" <cr><cr>i
     " autocmd filetype markdown nnoremap <buffer>  :w <bar>:call Compile()<cr><cr>:call Preview()<cr><cr><cr>
augroup END
]])
