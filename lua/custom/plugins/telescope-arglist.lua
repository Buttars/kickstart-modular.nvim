return {
  'sam4llis/telescope-arglist.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  event = 'VimEnter',
  config = function()
    require('telescope').load_extension 'arglist'
  end,
}
