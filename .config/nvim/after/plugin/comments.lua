require('nvim_comment').setup({
  create_mappings = false,
})

-- Custom mappings for commenting code
vim.keymap.set("n", "<leader>/", ":CommentToggle<CR>")
vim.keymap.set("v", "<leader>/", ":CommentToggle<CR>gv=gv")
vim.keymap.set("n", "<C-_>", ":CommentToggle<CR>")
vim.keymap.set("v", "<C-_>", ":CommentToggle<CR>gv=gv")
