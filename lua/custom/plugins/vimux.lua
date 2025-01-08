return {
  'preservim/vimux',
  config = function()
    vim.g.VimuxUseNearest = 0

    vim.g.VimuxCloseOnExit = 1
  end,
  keys = {
    { '<leader>vo', ':VimuxOpenRunner<CR>', desc = '[V]imux[O]penRunner' },
    { '<leader>vp', ':VimuxPromptCommand<CR>', desc = '[V]imux[P]romptCommand' },
    { '<leader>vl', ':VimuxRunLastCommand<CR>', desc = '[V]imux[R]unLastCommand' },
    { '<leader>vi', ':VimuxInspectRunner<CR>', desc = '[V]imux[I]nspectRunner' },
    { '<leader>vz', ':VimuxZoomRunner<CR>', desc = '[V]imux[Z]oomRunner' },
  },
}
