return {
  "terrortylor/nvim-comment",
  keys = {
    { "<leader>/", "<CMD>CommentToggle<CR>", },
    { "<leader>/", "<CMD>CommentToggle<CR>gv=gv", mode = "v" },
    { "<C-/>",     "<CMD>CommentToggle<CR>", },
    { "<C-/>",     "<CMD>CommentToggle<CR>gv=gv", mode = "v" },
    { "<C-_>",     "<CMD>CommentToggle<CR>", },
    { "<C-_>",     "<CMD>CommentToggle<CR>gv=gv", mode = "v" },
  },
  opts = {
    create_mappings = false,
  },
}
