return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua.with({
          extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        }),
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines,
      },
      on_attach = function(client, buffer)
        if not client.supports_method("textDocument/formatting") then
          return
        end

        local opts = { noremap = true, silent = true, buffer = buffer }
        vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, opts)

        if vim.bo.filetype == "yaml" then
          return
        end

        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        vim.api.nvim_clear_autocmds({
          group = augroup,
          buffer = buffer,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = buffer,
          callback = function()
            vim.lsp.buf.format(opts)
          end,
        })
      end,
    })
  end,
}
