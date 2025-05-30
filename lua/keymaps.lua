-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

local function lineCountByPercentage(percentageAsInt)
  local currentWindowHeight = vim.fn.winheight(0)
  local percentage = percentageAsInt / 100
  return math.floor(currentWindowHeight * percentage)
end

vim.keymap.set('n', '<C-u>', function()
  vim.cmd('norm! ' .. tostring(lineCountByPercentage(25)) .. 'kzz')
end)
vim.keymap.set('n', '<C-d>', function()
  vim.cmd('norm! ' .. tostring(lineCountByPercentage(25)) .. 'jzz')
end)

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
local function close_or_switch_buffer()
  local buffers = vim.fn.getbufinfo { buflisted = 1 }
  if #buffers > 1 then
    local current_buf = vim.api.nvim_get_current_buf()
    vim.cmd 'bnext'
    vim.cmd('bdelete ' .. current_buf)
  else
    vim.cmd 'bdelete'
  end
end

-- Buffer mappings
-- Buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete current buffer' })

-- Git-related keybindings
vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = 'Git status' })
vim.keymap.set('n', '<leader>gd', ':Gdiffsplit<CR>', { desc = 'Git diff' })
vim.keymap.set('n', '<leader>gb', ':Gblame<CR>', { desc = 'Git blame' })
vim.keymap.set('n', '<leader>gl', ':Glog<CR>', { desc = 'Git log' })
vim.keymap.set('n', '<leader>x', close_or_switch_buffer, { noremap = true, silent = true })
vim.keymap.set('n', '<TAB', ':bnext<CR>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>', { desc = 'Go to previous buffer' })

-- Toggle Spellcheck
vim.keymap.set('n', '<leader>tz', ':setlocal spell!<CR>', { desc = 'Toggle Spellcheck' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- ZenMode
vim.keymap.set('n', '<leader>zz', ':ZenMode<CR>', { noremap = true, silent = true })

-- vim: ts=2 sts=2 sw=2 et
