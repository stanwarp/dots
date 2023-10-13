return {
  'tjdevries/colorbuddy.nvim',
  'jubnzv/virtual-types.nvim',
  'whatyouhide/vim-gotham',
  'luisiacc/gruvbox-baby',
  'shaunsingh/nord.nvim',
  'dzfrias/noir.nvim',
  {
    lazy = false,
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
  },
  'mrjones2014/smart-splits.nvim',
  "rebelot/kanagawa.nvim",

  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  'wsdjeg/vim-fetch',
  'wesQ3/vim-windowswap',
  'tpope/vim-fireplace',
  'dstein64/vim-startuptime',
  'luc-tielen/telescope_hoogle',

  'alaviss/nim.nvim',
  'j-hui/fidget.nvim',
  'nvim-pack/nvim-spectre',
  'junegunn/fzf',
  'junegunn/fzf.vim',
  'ziglang/zig.vim',
  'monkoose/fzf-hoogle.vim',

  'nvim-treesitter/nvim-treesitter-context',
  "simrat39/symbols-outline.nvim",
  'nvim-treesitter/playground',
  "nvim-treesitter/nvim-treesitter-textobjects",

  -- 'NeogitOrg/neogit',
  'sindrets/diffview.nvim',

  'folke/tokyonight.nvim',

  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function() require("nvim-autopairs").setup {} end
  },

  { 'nvim-tree/nvim-web-devicons', event = "VeryLazy" },

  --  'folke/neodev.nvim',

  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        icons = true,
        -- your configuration comes here
        -- or leave it empty to  the default settings
        -- refer to the configuration section below
      }
    end
  },

  { 'rose-pine/neovim',            name = 'rose-pine' },

  'ThePrimeagen/harpoon',

  {
    'mbbill/undotree',
    lazy = false,
  },

  { 'tpope/vim-surround', lazy = false },
  {
    'willothy/moveline.nvim',
    build = 'make',
    lazy = false,
  },
  {
    'rktjmp/lush.nvim'
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    lazy = false,
  },
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons'      -- optional
    }
  },
  {
    'kevinhwang91/nvim-bqf',
    name = 'qf',
    dependencies = { 'junegunn/fzf.vim', 'junegunn/fzf' },
    event = "VeryLazy"
  },

  { 'tpope/vim-rsi',      lazy = false },

  --  'tpope/vim-repeat',

  { 'tpope/vim-fugitive', event = "VeryLazy" },

  {
    "luukvbaal/statuscol.nvim",
    config = function()
      require("statuscol").setup {
        setopt = true,
      }
    end,
  },

  'machakann/vim-sandwich',

  {
    "terrortylor/nvim-comment",
    lazy   = false,

    config = function()
      require('nvim_comment').setup {
        comment_empty = false
      }
    end
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   event="VeryLazy",
  --     hijack_netrw_behavior="disabled",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     'MunifTanjim/nui.nvim',
  --   },

  --   -- config = function()
  --   --   require("config.neotree")
  --   -- end,
  -- },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
      }
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },

  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  'echasnovski/mini.nvim',
  "gpanders/nvim-parinfer",
  'nvim-telescope/telescope.nvim',

  'nvim-telescope/telescope-file-browser.nvim',

  'jose-elias-alvarez/typescript.nvim',

  'nvim-lua/plenary.nvim', -- Common utilitie
  { 'j-hui/fidget.nvim',                 branch = 'legacy',                      lazy = false },
  -- {
  -- 'VonHeikemen/lsp-zero.nvim',
  -- event = "VeryLazy",
  -- branch = 'v1.x',
  -- dependencies = {
  -- },
  -- config = function()
  --   require('gitsigns').setup()
  -- end
  -- },
  { 'neovim/nvim-lspconfig',             event = { 'BufReadPre', 'BufNewFile' }, },
  { 'williamboman/mason.nvim',           event = { 'BufReadPre', 'BufNewFile' }, },
  { 'williamboman/mason-lspconfig.nvim', event = { 'BufReadPre', 'BufNewFile' }, },
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },


  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    lazy = false
  },
  {
    'hrsh7th/cmp-buffer',
    event = 'InsertEnter',
    lazy = false
  },
  {
    'saadparwaiz1/cmp_luasnip',
    event = 'InsertEnter',
    lazy = false
  },
  {
    'hrsh7th/cmp-nvim-lua',
    event = 'InsertEnter',
    lazy = false
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    event = 'InsertEnter',
    lazy = false
  },
  {
    'hrsh7th/cmp-path',
    event = 'InsertEnter',
    lazy = false
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension "frecency"
    end,
    dependencies = { "kkharji/sqlite.lua" },
  }
}
