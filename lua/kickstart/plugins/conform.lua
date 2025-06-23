return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          local has_client = function(client_name)
            for _, client in ipairs(vim.lsp.get_clients()) do
              if client.name == client_name then
                return true
              end
            end
          end

          if has_client 'eslint' then
            vim.cmd 'EslintFixAll'
          end

          require('conform').format { async = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = nil
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      default_format_opts = {
        lsp_format = 'fallback',
      },
      formatters_by_ft = (function()
        local javascript_formatters = {
          'prettierd',
          'prettier',
          stop_after_first = true,
        }

        return {
          lua = { 'stylua' },
          -- Conform can also run multiple formatters sequentially
          -- python = { "isort", "black" },
          --
          -- You can use 'stop_after_first' to run the first available formatter from the list
          nix = { 'nixpkgs-fmt' },
          javascript = javascript_formatters,
          typescript = javascript_formatters,
          javascriptreact = javascript_formatters,
          typescriptreact = javascript_formatters,
          json = { 'prettierd', 'prettier', stop_after_first = true },
          jsonc = { 'prettierd', 'prettier', stop_after_first = true },
          scss = { 'prettierd', 'prettier', stop_after_first = true },
        }
      end)(),
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
