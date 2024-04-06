local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- colors
  'sainnhe/edge',
  'sainnhe/sonokai',
  'edeneast/nightfox.nvim',
  { 'embark-theme/vim', name = 'embark' },
  { 'catppuccin/nvim',  name = 'catppuccin' },

  'nvim-tree/nvim-tree.lua',
  'mbbill/undotree',
  'wellle/targets.vim',
  'tpope/vim-fugitive',
  'tpope/vim-endwise',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',
  'vim-scripts/ReplaceWithRegister',
  'folke/lsp-colors.nvim',
  'github/copilot.vim',

  {
    'm4xshen/autoclose.nvim',
    config = function()
      require('autoclose').setup({
        options = {
          disable_when_touch = false,
        },
      })
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  {
    'nvim-lualine/lualine.nvim',
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'rafamadriz/friendly-snippets' },
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
      'leoluz/nvim-dap-go',
      'theHamsta/nvim-dap-virtual-text',
    }
  },

  { 'akinsho/git-conflict.nvim', version = '*', config = true }

})
