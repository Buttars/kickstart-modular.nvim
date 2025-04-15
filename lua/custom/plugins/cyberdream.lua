return {
  'scottmckendry/cyberdream.nvim',
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'cyberdream'
    vim.cmd.hi 'Comment gui=none'
  end,
  config = function()
    require('cyberdream').setup {
      theme = {
        colors = {
          bg = '#0F0F11',
        },
      },
    }
  end,
}
