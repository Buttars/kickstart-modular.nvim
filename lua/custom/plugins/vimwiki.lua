return {
  'vimwiki/vimwiki',
  event = 'VimEnter',
  lazy = true,
  init = function()
    vim.g.vimwiki_list = {
      {
        path = '~/vimwiki/',
        syntax = 'markdown',
        ext = '.md',
      },
    }
  end,
}
