vim.cmd("autocmd!")

vim.opt.pumblend = 17
vim.opt.wildmode = "longest:full"
vim.opt.wildoptions = "pum"

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.laststatus = 2

vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.incsearch = true    -- Makes search act like search in modern browsers
vim.opt.showmatch = true    -- show matching brackets when text indicator is over them
vim.opt.ignorecase = true   -- Ignore case when searching...
vim.opt.smartcase = true    -- ... unless there is a capital letter in the query
vim.opt.hidden = true       -- I like having buffers stay around
vim.opt.equalalways = false -- I don't like my windows changing all the time
vim.opt.splitright = true   -- Prefer windows splitting to the right
vim.opt.splitbelow = true   -- Prefer windows splitting to the bottom
vim.opt.updatetime = 1000   -- Make updates happen faster
vim.opt.scrolloff = 10      -- Make it so there are always ten lines below my cursor
vim.wo.number = true
vim.opt.relativenumber = true

vim.opt.title = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.clipboard:append("unnamedplus")

vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
-- vim.opt.inccommand = 'split'
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' }
-- vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.formatoptions:append { 'r' }

local undo_dir = vim.loop.os_homedir() .. "/.vim/undodir"

  local fn = vim.fn
  if not fn.isdirectory(undo_dir) then
    fn.mkdir(undo_dir, "", 0700)
  end
require("settings").setup(undo_dir)

-- vim.cmd [[
-- augroup AutoSaveGroup
--   autocmd!
--   " view files are about 500 bytes
--   " bufleave but not bufwinleave captures closing 2nd tab
--   " nested is needed by bufwrite* (if triggered via other autocmd)
--   " BufHidden for compatibility with `set hidden`
--   autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
--   autocmd BufWinEnter ?* silent! loadview
-- augroup end
-- ]]
