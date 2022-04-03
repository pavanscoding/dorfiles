local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
    use 'vimwiki/vimwiki'
    use 'bluz71/vim-nightfly-guicolors'
    use 'sheerun/vim-polyglot'
    use 'tpope/vim-surround'
    use 'ervandew/supertab'
    use 'jiangmiao/auto-pairs'
    use 'Vimjas/vim-python-pep8-indent'
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'tpope/vim-commentary'
    use 'lervag/vimtex'
    use 'voldikss/vim-mma'
    use 'folke/tokyonight.nvim'
    use {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
    }
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }    
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = function() require'nvim-tree'.setup {} end
    }
    -- use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'LinArcX/telescope-env.nvim' }
    use 'glepnir/dashboard-nvim'
    use 'vim-scripts/HTML-AutoCloseTag'
    -- haven't done setup
    use {
        'windwp/nvim-ts-autotag',
        requires = { {'nvim-treesitter/nvim-treesitter'} }
    }
    -- use 'sidebar-nvim/sections-dap'
    -- use 'mfussenegger/nvim-dap'
    use 'sidebar-nvim/sidebar.nvim' 
    -- use 'xeluxee/competitest.nvim'
    use 'nathom/filetype.nvim'
    use 'lewis6991/impatient.nvim'
    use {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'kyazdani42/nvim-web-devicons',
        },
        config = function ()
        require"octo".setup()
        end
    }
    use 'tpope/vim-fugitive'
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release' -- To use the latest release
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
    }
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'
    
if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
