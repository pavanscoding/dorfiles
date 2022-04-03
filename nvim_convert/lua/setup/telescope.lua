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

require("telescope").setup {
    defaults = {
        preview=false,
        preview = {
            treesitter = false
        },
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    sorting_strategy = "ascending",
    color_devicons = true,
    layout_config = {
      prompt_position = "top",
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      },
    },
    dynamic_preview_title = true,
  },
}
-- require('telescope').load_extension('gh')
require('telescope').load_extension('env')
END

nmap("ff",":Telescope find_files<cr>")
nmap("fg",":Telescope live_grep<cr>")
nmap("fb",":Telescope buffers<cr>")
nmap("fh",":Telescope help_tags<cr>")
