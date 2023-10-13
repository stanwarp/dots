return {
  setup = function(undo_dir)
    local encoding = "utf-8"
    local opts = {
      autoindent = true,
      background = "dark",
      backup = false,
      clipboard = "unnamedplus",
      cmdheight = 1,
      completeopt = "menuone,noselect",
      cursorline = true,
      encoding = encoding,
      errorbells = false,
      expandtab = true,
      fileencoding = encoding,
      fileformats = "unix,dos,mac",
      hidden = true,
      history = 1000,
      hlsearch = true,
      ignorecase = true,
      incsearch = true,
      laststatus = 3,
      lazyredraw = true,


      -- magic = true,
      -- mat = 2,
      -- mouse = "nvi",
      number = true,
      relativenumber = true,
      -- ruler = true,
      -- scrolloff = 7,
      -- shiftwidth = 2,
      -- shortmess = "I",
      showmatch = true,
      showmode = false,
      signcolumn = "yes:1",
      smartindent = true,
      smarttab = true,

      swapfile = false,
      tabstop = 2,
      termguicolors = true,
      timeoutlen = 500,


      undodir = undo_dir,
      undofile = true,
      updatetime = 100,
      visualbell = false,
      wrap = true,
      writebackup = false,
    }
    for opt, val in pairs(opts) do
      vim.o[opt] = val
    end
  end
}
