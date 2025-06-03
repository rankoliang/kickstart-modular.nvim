return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-jest',
      'mfussenegger/nvim-dap',
    },
    keys = function()
      return {
        {
          '<leader>tn',
          function()
            require('neotest').run.run()
          end,
          desc = 'neotest: [T]est [N]earest',
        },
        {
          '<leader>tf',
          function()
            require('neotest').run.run(vim.fn.expand '%')
          end,
          desc = 'neotest: [T]est [F]ile',
        },
        {
          '<leader>ts',
          function()
            require('neotest').summary.toggle()
          end,
          desc = 'neotest: [T]est [S]ummary',
        },
        {
          '<leader>tw',
          function()
            require('neotest').watch.toggle(vim.fn.expand '%')
          end,
          desc = 'neotest: [T]est [W]atch',
        },
        {
          '<leader>ta',
          function()
            require('neotest').run.attach()
          end,
          desc = 'neotest: [T]est [A]ttach',
        },
        {
          '<leader>tt',
          function()
            require('neotest').output_panel.toggle()
          end,
          desc = 'neotest: [T]est [T]oggle Output',
        },
      }
    end,
    opts = function()
      return {
        adapters = {
          require 'neotest-jest' {
            jestCommand = 'npm test --',
            cwd = function()
              return vim.fn.getcwd()
            end,
          },
        },
      }
    end,
  },
}
