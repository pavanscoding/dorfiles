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

vim.g.vimtex_quickfix_enabled=0
vim.g.tex_flavor="latex"
vim.g.vimtex_fold_manual=1
vim.cmd([[
    let g:vimtex_compiler_latexmk = {
        \ 'continuous' : 1,
        \}
    au FileType tex let b:AutoPairs = AutoPairsDefine({'$':'$'})
]])
vim.g.vimtex_compiler_progname="nvr"
vim.g.vimtex_view_method="zathura"

