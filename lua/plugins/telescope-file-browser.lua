return {
  "nvim-telescope/telescope-file-browser.nvim",
  requieres = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").load_extension "file_browser"
    vim.api.nvim_set_keymap(
      "n",
      "<space>fb",
      ":Telescope file_browser<CR> path=%:p:h select_buffer=true<CR>",
      { noremap = true }
    )
  end
}
