return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
      },
    })

    vim.keymap.set("n", "<A-,>", "<Cmd>BufferLineCyclePrev<CR>", {})
    vim.keymap.set("n", "<A-.>", "<Cmd>BufferLineCycleNext<CR>", {})
    vim.keymap.set("n", "<A-<>", "<Cmd>BufferLineMovePrev<CR>", {})
    vim.keymap.set("n", "<A->>", "<Cmd>BufferLineMoveNext<CR>", {})
    vim.keymap.set("n", "<A-x>", "<Cmd>BufferLineClose<CR>", {})
  end,
}
