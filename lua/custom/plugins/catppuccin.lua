return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    integrations = {
      fzf = true,
    },
  },
  init = function()
    vim.cmd.colorscheme 'catppuccin'

    vim.cmd.hi 'Folded guibg=#313244 guifg=#a6adc8'
  end,
}
