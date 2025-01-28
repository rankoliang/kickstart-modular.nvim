return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      gitbrowse = { enabled = true },
      indent = { enabled = true, animate = { enabled = false } },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
    },
    keys = function()
      local Snacks = require 'snacks'
      return {
        {
          '<leader>gb',
          function(args)
            Snacks.gitbrowse(args)
          end,
          desc = 'Snacks: [G]it [B]rowse',
          mode = { 'n', 'v' },
        },
      }
    end,
  },
}
