vim.g.mapleader = " "

-- Shortcut to explorer mode
vim.keymap.set("n", "<leader> ", vim.cmd.Ex)

-- Move lines easily in visual mode
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv")

-- Append next line to current
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace highlight with buffer without yanking
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Copy and paste from system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+P")

-- Delete into void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("n", "<leader>D", "\"_d")

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Search current word without submitting
vim.keymap.set("n", "<leader>f", [[/<C-r><C-w>]])
-- Replace current word without submitting
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
