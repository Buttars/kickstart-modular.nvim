return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = function() end,
  config = function()
    return require('ibl').setup {
      whitespace = {},
      scope = {
        show_start = false,
        show_end = false,
        highlight = { 'Function', 'Label' },
        char = '▏',
      },
      indent = {
        smart_indent_cap = true,
      },
    }
  end,
}
