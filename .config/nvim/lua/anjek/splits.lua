-- Resize splits with ease
vim.keymap.set("n", "<C-W><C-Left>", "<C-w>>", { desc = "Split: Move left" })
vim.keymap.set("n", "<C-W><C-Right>", "<C-w><", { desc = "Split: Move right" })
vim.keymap.set("n", "<C-W><C-Up>", "<C-w>+", { desc = "Split: Move up" })
vim.keymap.set("n", "<C-W><C-Down>", "<C-w>-", { desc = "Split: Move down" })

-- Swap splits with ease
vim.keymap.set("n", "<C-W><S-Left>", "<C-w>H", { desc = "Split: Swap left" })
vim.keymap.set("n", "<C-W><S-Right>", "<C-w>L", { desc = "Split: Swap right" })
vim.keymap.set("n", "<C-W><S-Up>", "<C-w>K", { desc = "Split: Swap up" })
vim.keymap.set("n", "<C-W><S-Down>", "<C-w>J", { desc = "Split: Swap down" })
