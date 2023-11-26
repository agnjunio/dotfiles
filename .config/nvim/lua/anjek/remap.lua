vim.g.mapleader = " "

-- Move lines easily in visual mode
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv")

-- Append next line to current
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace highlight with buffer without yanking
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Replace from Clipboard" })

-- Copy and paste from system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Copy to Clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Copy to Clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Copy to Clipboard" })

vim.keymap.set("n", "<leader>p", "\"+p", { desc = "Paste from Clipboard" })
vim.keymap.set("v", "<leader>p", "\"+p", { desc = "Paste from Clipboard" })
vim.keymap.set("n", "<leader>P", "\"+P", { desc = "Paste from Clipboard" })

-- Delete into void register
vim.keymap.set("n", "<leader>d", "\"_d", { desc = "Delete" })
vim.keymap.set("n", "<leader>D", "\"_d", { desc = "Delete" })

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Search current word without submitting
vim.keymap.set("n", "<leader>f", [[/<C-r><C-w>]], { desc = "Search current word" })
-- Replace current word without submitting
vim.keymap.set("n", "<leader>s", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current word" })

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
