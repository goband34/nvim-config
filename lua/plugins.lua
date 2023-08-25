require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true})
        ts_update()
      end
    }

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'EdenEast/nightfox.nvim' 
end)

-- nvim-tree config

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup()

vim.keymap.set('', '<Leader>to', ':NvimTreeOpen<Enter>')
vim.keymap.set('', '<Leader>tc', ':NvimTreeClose<Enter>')
