require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
    }

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'EdenEast/nightfox.nvim' 

    use 'mattn/emmet-vim'
    
    use 'neovim/nvim-lspconfig'

    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end
    }

    use "windwp/nvim-ts-autotag"
end)

-- nvim-tree config


require('nvim-tree').setup()
require("lspconfig_config")
require("ts_config")

-- Personal
require('commands')
vim.keymap.set('', '<Leader>to', ':NvimTreeOpen<Enter>')
vim.keymap.set('', '<Leader>tc', ':NvimTreeClose<Enter>')
