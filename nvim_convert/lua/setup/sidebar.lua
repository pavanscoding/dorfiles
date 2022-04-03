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

-- IF I NEED IT, GET A DEBUGGER FROM NVIM-DAP
require("sidebar-nvim").setup({
    sections = {
        "git",
--        require("dap-sidebar-nvim.breakpoints"),
        "todos"
    },
    dap = {
        breakpoints = {
            icon = "🔍"
        }
    }
})

nmap("<F6>", ":SidebarNvimToggle")
