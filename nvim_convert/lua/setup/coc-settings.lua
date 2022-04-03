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

function omap(shortcut, command)
  map('o', shortcut, command)
end
-- all auto completion engines
vim.cmd([[
let g:coc_global_extensions = [
    \ 'coc-pyright',
    \ 'coc-texlab',
    \ 'coc-clangd',
    \ 'coc-html',
    \ 'coc-tsserver',
    \ 'coc-sh',
    \ 'coc-css',
    \ 'coc-lsp-wl',
    \ 'coc-java',
    \ ]
]])
-- Python autocompletion
vim.g.python3_host_prog="/usr/bin/python3"
vim.cmd(autocmd FileType scss setl iskeyword+=@-@)

-- reverses order of coc.nvim autocompletion
vim.g.SuperTabDefaultCompletionType="<c_n>"
nmap("<silent> <leader>?", ":call CocAction('diagnosticInfo') <CR>")
-- Text Edit might fail if hidden is not set
vim.opt.hidden=true

-- Some servers have some issues with backup files, see #649
vim.opt.backup=false
vim.opt.writebackup=false

-- Give more space for displaying messages
vim.opt.cmdheight=2
-- Gives shorted update times
vim.opt.updatetime=300
-- Random shit they told me to put
vim.cmd([[
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
]])
-- Navigate through the diagnostics
nmap("<silent> [g","<Plug>(coc-diagnostic-prev)")
nmap("<silent> ]g","<Plug>(coc-diagnostic-next)")
-- goto code navigation
nmap("<silent> gd","<Plug>(coc-diagnostic-prev)")
nmap("<silent> gy","<Plug>(coc-type-definition)")
nmap("<silent> gi","<Plug>(coc-implementation)")
nmap("<silent> gr","<Plug>(coc-references)")
-- Use K to show the documentation is preview window
nmap("<silent> K", ":call <SID>show_documentation()<cr>")
vim.cmd([[
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
]])
-- Symbol renaming
nmap("<leader>rn","<Plug>(coc-rename)")
-- Formatting selected code
xmap("<leader>f","<Plug>(coc-format-selected)")
nmap("<leader>f","<Plug>(coc-format-selected)")

vim.cmd([[
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
]])
-- Applying codeAction to the selected  region
-- Example: `<leader>aap` for current paragraph
xmap("<leader>a","<Plug>(coc-codeaction-selected)")
nmap("<leader>a","<Plug>(coc-codeaction-selected)")
-- Remap keys for applying codeAction to the current buffer
nmap("<leader>ac","<Plug>(coc-codeaction)")
-- Apply AutoFix to problem on the current line
nmap("<leader>qf","<Plug>(coc-fix-current)")
-- Map functions and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language serfer
xmap("if","<Plug>(coc-funcobj-i)")
omap("if","<Plug>(coc-funcobj-i)")
xmap("af","<Plug>(coc-funcobj-a)")
omap("af","<Plug>(coc-funcobj-a)")
xmap("ic","<Plug>(coc-classobj-i)")
omap("ic","<Plug>(coc-classobj-i)")
xmap("ac","<Plug>(coc-classobj-a)")
omap("ac","<Plug>(coc-classobj-a)")

-- Remap <C-f> and <C-b> for scroll float windows/popups.
vim.cmd([[
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
]])

-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
nmap("<silent> <C-s>","<Plug(coc-range-select)")
xmap("<silent> <C-s>","<Plug(coc-range-select)")

vim.cmd([[
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
]])

nmap("<silent><nowait> <space>a",":<C-u>CocList diagnostics<cr>")

nmap("<silent><nowait> <space>e",":<C-u>CocList extensions<cr>")

nmap("<silent><nowait> <space>c",":<C-u>CocList commands<cr>")

nmap("<silent><nowait> <space>o",":<C-u>CocList outline<cr>")

nmap("<silent><nowait> <space>s",":<C-u>CocList -I  symbols<cr>")

nmap("<silent><nowait> <space>j",":<C-u>CocNext<cr>")

nmap("<silent><nowait> <space>k",":<C-u>CocPrev<cr>")

nmap("<silent><nowait> <space>p",":<C-u>CocListResume<cr>o")

vim.g.coc_snippet_next=','
vim.g.coc_snippet_prev='*'
