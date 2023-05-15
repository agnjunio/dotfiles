local telescope = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.git_files, {})
vim.keymap.set('n', '<leader>fs', function() 
	telescope.grep_string({ search = vim.fn.input("Grep > ") });
end)
