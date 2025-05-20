return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot', -- lazy-load on command
  event = 'InsertEnter', -- or use a more eager trigger like 'VeryLazy'
  opts = {
    suggestion = {
      enabled = false, -- disable inline suggestions (optional if using Avante)
    },
    panel = {
      enabled = false, -- disable Copilot panel (optional if using Avante)
    },
    filetypes = {
      markdown = true,
      help = false,
      gitcommit = true,
      gitrebase = false,
      ['.'] = false,
    },
  },
  config = function(_, opts)
    require('copilot').setup(opts)
  end,
}
