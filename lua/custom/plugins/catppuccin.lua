return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'catppuccin'

    vim.cmd.hi 'Folded guibg=#313244 guifg=#a6adc8'
  end,
}
