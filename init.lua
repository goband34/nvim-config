vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local set = vim.opt

set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.encoding = 'utf-8'
set.autoindent = true
set.number = true
set.relativenumber = true


vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
    ["+"] = 'clip.exe',
    ["*"] = 'clip.exe'
  },
  paste = {
    ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ["*"] = 'powershell.exe -c [Consolle]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'
  },
  cache_enabled = 0
}

require('plugins')
vim.cmd('colorscheme duskfox')

vim.keymap.set('', '<Leader>as', openColorSelectPopup)

vim.keymap.set('', '<Leader>q', ':bp<bar>sp<bar>bn<bar>bd<enter>')

