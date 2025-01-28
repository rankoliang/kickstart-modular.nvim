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
      dashboard = {
        enabled = true,
        preset = {
          keys = {
            { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
            { icon = ' ', key = 'b', desc = 'Browse Files', action = '' },
            { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
            { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
          },
        },
        sections = {
          { section = 'header' },
          { icon = ' ', title = 'Recent Files', section = 'recent_files', cwd = true, indent = 2, padding = 1 },
          { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
          { section = 'startup' },
        },
      },
      gitbrowse = { enabled = true },
      indent = { enabled = true, animate = { enabled = false } },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true, folds = { open = true, git_hl = true } },
      lazygit = { enabled = true },
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
        {
          '<leader>lg',
          function(args)
            Snacks.lazygit(args)
          end,
          desc = 'Snacks: [L]azy[G]it',
        },
        {
          '<leader>lf',
          function(args)
            Snacks.lazygit.log_file(args)
          end,
          desc = 'Snacks: [L]azyGit log [F]ile',
        },
      }
    end,
  },
}
