return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function opts(desc)
          return { buffer = bufnr, desc = desc }
        end

        local map = vim.keymap.set

        map('n', '<leader>rh', gs.reset_hunk, opts '[R]eset [H]unk')
        map('n', '<leader>ph', gs.preview_hunk, opts '[P]review [H]unk')
        map('n', '<leader>gb', gs.blame_line, opts '[G]it [B]lame Line')
      end,
    }
  end,
}
