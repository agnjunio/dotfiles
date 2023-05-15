vim.keymap.set('n', '<F5>', vim.cmd.UndotreeToggle)

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.cache/undodir"
vim.opt.undofile = true
