-- https://www.reddit.com/r/neovim/comments/1fzn1zt/custom_fold_text_function_with_treesitter_syntax/
local function fold_virt_text(result, s, lnum, coloff)
  if not coloff then
    coloff = 0
  end
  local text = ''
  local hl
  for i = 1, #s do
    local char = s:sub(i, i)
    local hls = vim.treesitter.get_captures_at_pos(0, lnum, coloff + i - 1)
    local _hl = hls[#hls]
    if _hl then
      local new_hl = '@' .. _hl.capture
      if new_hl ~= hl then
        table.insert(result, { text, hl })
        text = ''
        hl = nil
      end
      text = text .. char
      hl = new_hl
    else
      text = text .. char
    end
  end
  table.insert(result, { text, hl })
end

function _G.custom_foldtext()
  local start = vim.fn.getline(vim.v.foldstart):gsub('\t', string.rep(' ', vim.o.tabstop))
  local end_str = vim.fn.getline(vim.v.foldend)
  local end_ = vim.trim(end_str)
  local result = {}
  fold_virt_text(result, start, vim.v.foldstart - 1)
  table.insert(result, { ' ... ', 'Delimiter' })
  fold_virt_text(result, end_, vim.v.foldend - 1, #(end_str:match '^(%s+)' or ''))
  local suffix = (' 󰁂 %d '):format(vim.v.foldend - vim.v.foldstart + 1)
  table.insert(result, { suffix, 'MoreMsg' })
  return result
end

vim.opt.foldmethod = 'expr'
vim.opt.foldlevelstart = 4
vim.opt.foldminlines = 3
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldcolumn = 'auto'
vim.opt.fillchars = 'fold: '
vim.opt.foldtext = 'v:lua.custom_foldtext()'

vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function()
    local max_foldlevel = 0
    for i = 1, vim.api.nvim_buf_line_count(0) do
      local fold_level = vim.fn.foldlevel(i)
      if fold_level > max_foldlevel then
        max_foldlevel = fold_level
      end
    end
    vim.opt.foldlevel = math.max(vim.opt.foldminlines:get(), max_foldlevel)
  end,
})
