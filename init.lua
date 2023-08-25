local global_set = vim.g
local set = vim.opt

set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.encoding = 'utf-8'
global_set.autoindent = true
set.number = true
set.relativenumber = true

global_set.clipboard = {
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

require('commands')
vim.keymap.set('', '<Leader>as', openColorSelectPopup)

vim.cmd('colorscheme duskfox')
require('plugins')

vim.keymap.set('', '<Leader>q', ':bp<bar>sp<bar>bn<bar>bd<enter>')
