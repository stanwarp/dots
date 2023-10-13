local map = vim.keymap.set

map('n', '<leader>tb', ':Neotree toggle show buffers right<cr>')
map('n', '<leader>ts', ':Neotree toggle show git_status right <cr>')
map('n', '<leader>tf', ':Neotree toggle show reveal_force_cwd right<cr>')

require('neo-tree').setup{
  sources = {
    'filesystem',
    'buffers',
    'git_status',
    'document_symbols',
  },
  hijack_netrw_behavior = "disabled";
  auto_clean_after_session_restore = true,
  close_if_last_window = true,
  source_selector = {
    winbar = true,
    sources = {
      { source = 'filesystem', display_name = ' 󰉓  Files ' },
      { source = 'git_status', display_name = ' 󰊢  Git ' },
      { source = 'buffers', display_name = ' 󰗚  Buffers ' },
      { source = 'document_symbols', display_name = '   Symbols ' },
    },
  },
  window = {
    position = 'right',
  },
  filesystem = {
    follow_current_file = true,
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    --   hide_by_name = {
    --     'node_modules',
    --   },
    --   never_show = {
    --     '.DS_Store',
    --     'thumbs.db',
    --   },
    },
  },
  default_component_configs = {
    icon = {
      folder_empty = '󰜌',
      folder_empty_open = '󰜌',
    },
    git_status = {
      symbols = {
        renamed = '󰁕',
        unstaged = '󰄱',
      },
    },
  },
  document_symbols = {
    kinds = {
      File = { icon = '󰈙', hl = 'Tag' },
      Namespace = { icon = '󰌗', hl = 'Include' },
      Package = { icon = '󰏖', hl = 'Label' },
      Class = { icon = '󰌗', hl = 'Include' },
      Property = { icon = '󰆧', hl = '@property' },
      Enum = { icon = '󰒻', hl = '@number' },
      Function = { icon = '󰊕', hl = 'Function' },
      String = { icon = '󰀬', hl = 'String' },
      Number = { icon = '󰎠', hl = 'Number' },
      Array = { icon = '󰅪', hl = 'Type' },
      Object = { icon = '󰅩', hl = 'Type' },
      Key = { icon = '󰌋', hl = '' },
      Struct = { icon = '󰌗', hl = 'Type' },
      Operator = { icon = '󰆕', hl = 'Operator' },
      TypeParameter = { icon = '󰊄', hl = 'Type' },
      StaticMethod = { icon = '󰠄 ', hl = 'Function' },
    }
  }
}

