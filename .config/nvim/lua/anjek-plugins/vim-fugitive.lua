return {
  'tpope/vim-fugitive',
  lazy = true,
  keys = {
    { "<leader>gs", "<cmd>Git<CR>",       desc = "Git status" },
    { "<leader>gb", "<cmd>Git blame<CR>", desc = "Git blame" },
  },
}
