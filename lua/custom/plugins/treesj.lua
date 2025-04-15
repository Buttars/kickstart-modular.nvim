return {
  'Wansmer/treesj',
  -- TODO: Configure key mapping for this thing.
  -- keys = { '<space>m', '<space>j', '<space>s' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup {}
  end,
}
