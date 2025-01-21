return {
  {
    'sindrets/diffview.nvim',
    keys = {
      {
        '<leader>dv',
        function()
          -- https://github.com/sindrets/diffview.nvim/pull/455
          local lib = require 'diffview.lib'
          local view = lib.get_current_view()
          if view then
            -- Current tabpage is a Diffview; close it
            vim.cmd.DiffviewClose()
          else
            -- No open Diffview exists: open a new one
            vim.cmd.DiffviewOpen()
          end
        end,
        desc = '[D]iff[V]iew Toggle',
      },
    },
    opts = {},
  },
}
