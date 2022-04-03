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

vim.g.dashboard_default_executive='telescope'
vim.cmd([[
    nnoremap <silent> <expr> <leader>d winnr('$')==1 && tabpagenr('$')==1 && (len(getbufinfo({'buflisted':1})))==1 ? ':bw<CR>:Dashboard<CR>' : ':bw<CR>'
    let g:dashboard_custom_header = [
    \'             ;::::;                            ',   
    \'           ;::::; :;                           ', 
    \'         ;:::::;   :;                          ', 
    \'        ;:::::;     ;.                         ', 
    \'       ,:::::;       ;           OOO\          ', 
    \'       ::::::;       ;          OOOOO\         ', 
    \'       ;:::::;       ;         OOOOOOOO        ', 
    \'      ,;::::::;     ;;         / OOOOOOO       ', 
    \'    ;:::::::::`. ,,,;.        /  / DOOOOOO     ',  
    \'  .;;:::::::::::::::::;,     /  /     DOOOO    ', 
    \' ,::::::;::::::;;;;::::;,   /  /        DOOO   ', 
    \';`::::::`;::::::;;;::::: ,#/  /          DOOO  ',  
    \':`:::::::`;::::::;;::: ;::#  /            DOOO ',
    \'::`:::::::`;:::::::: ;::::# /              DOO ',
    \'`:`:::::::`;:::::: ;::::::#/               DOO ',
    \' :::`:::::::`;; ;:::::::::##                OO ',
    \' ::::`:::::::`;::::::::;:::#                OO ',
    \' `:::::`::::::::::::;;`:;::#                O  ',
    \'  `:::::`::::::::;; /  / `:#                   ',
    \]
]])
