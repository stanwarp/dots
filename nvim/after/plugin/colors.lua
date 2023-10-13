require "rose-pine".setup({
  disable_background = true,

})
require("tokyonight").setup({
  style = "storm",    -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  -- light_style = "day",        -- The theme is used when the background is set to light
  transparent = true, -- Enable this to disable setting the background color
  -- terminal_colors = true,     -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    --   -- Style to be applied to different syntax groups
    --   -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = { italic = true },
    floats = "transparent", -- style for floating windows
sidebars = "transparent"
  }
})

vim.g.tokyonight_dark_float = false

vim.g.nord_disable_background = true

vim.g.gruvbox_baby_transparent_mode = 1


-- vim.cmd [[colorscheme tokyonight]]

