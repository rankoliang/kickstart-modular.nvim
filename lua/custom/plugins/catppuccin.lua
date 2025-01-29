return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    custom_highlights = function(colors)
      return {
        Folded = { bg = colors.surface0, fg = colors.subtext0 },
      }
    end,
    integrations = {
      fzf = true,
      snacks = true,
      lsp_trouble = true,
      neotest = true,
      dadbod_ui = true,
      which_key = true,
      diffview = true,
    },
  },
  init = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
}
