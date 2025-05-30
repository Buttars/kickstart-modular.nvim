local config_home = os.getenv 'XDG_CONFIG_HOME' or os.getenv 'HOME' .. '/.config'
local copilot_config_path = config_home .. '/github-copilot/apps.json'
local file_exists = false

-- Check if the file exists
local file = io.open(copilot_config_path, 'r')
if file then
  file:close()
  file_exists = true
end

return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot', -- lazy-load on command
  event = 'InsertEnter', -- or use a more eager trigger like 'VeryLazy'
  opts = {
    suggestion = {
      enabled = file_exists, -- Set to true if the file exists, otherwise false
      auto_trigger = true, -- Automatically trigger suggestions as you type
      debounce = 75, -- Debounce time for suggestions
      keymap = {
        accept = '<C-l>', -- Keybinding to accept the suggestion
        -- next  aa= '<C-]>',
        -- prev = '<C-[>',
        dismiss = '<C-\\>',
      },
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

    -- Extend nvim-cmp configuration to handle Copilot suggestions
    local cmp = require 'cmp'

    -- Add event handlers for menu_opened and menu_closed
    cmp.event:on('menu_opened', function()
      vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on('menu_closed', function()
      vim.b.copilot_suggestion_hidden = false
    end)
  end,
}
