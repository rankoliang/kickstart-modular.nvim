return {
  {
    'MagicDuck/grug-far.nvim',
    opts = {},
    keys = {
      {
        '<leader>ra',
        function()
          local grug = require 'grug-far'
          local ext = vim.bo.buftype == '' and vim.fn.expand '%:e'
          grug.open {
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
            },
          }
        end,
        mode = { 'n', 'v' },
        desc = '[R]eplace [A]ll (grug-far)',
      },
      {
        '<leader>rb',
        function()
          local grug = require 'grug-far'
          grug.open {
            transient = true,
            prefills = {
              paths = vim.fn.expand '%',
            },
          }
        end,
        mode = { 'n', 'v' },
        desc = '[R]eplace in [B]uffer (grug-far)',
      },
    },
  },
}
