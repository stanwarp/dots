vim.g.mapleader = " "
vim.g.maplocalleader = ","

require('maps')
require('base')
require('highlights')
require('snips')

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  }
end

vim.loader.enable()
vim.opt.runtimepath:prepend(lazypath)

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
require('lazy').setup('plugins', {
  defaults = { lazy = true },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})

vim.api.nvim_command("autocmd FileType json setlocal commentstring=//%s")
vim.cmd [[ set background=dark ]]




vim.api.nvim_command("colorscheme tokyonight-night")

vim.cmd [[
    hi NvimTreeNormal guibg=NONE ctermbg=NONE
    hi NvimTreeNormalFloat guibg=NONE ctermbg=NONE
    hi NvimTreeNormalNC guibg=NONE ctermbg=NONE
    hi Normal guibg=NONE ctermbg=NONE
    hi NormalNC guibg=NONE ctermbg=NONE
    hi QuickFixLine guibg=NONE ctermbg=NONE
    hi Directory guifg=NONE guibg=NONE gui=NONE cterm=NONE
]]

-- require('color')
