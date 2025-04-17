return {
  'folke/persistence.nvim',
  event = 'BufReadPre', -- this will only start session saving when an actual file was opened
  opts = {},
  config = function()
    -- load the session for the current directory
    vim.keymap.set('n', '<leader>ps', function()
      require('persistence').load()
    end)

    -- select a session to load
    vim.keymap.set('n', '<leader>pS', function()
      require('persistence').select()
    end)

    -- load the last session
    vim.keymap.set('n', '<leader>pl', function()
      require('persistence').load { last = true }
    end)

    -- stop Persistence => session won't be saved on exit
    vim.keymap.set('n', '<leader>pd', function()
      require('persistence').stop()
    end)
  end,
}
