local builtin = require('telescope.builtin')
local trouble = require('trouble.providers.telescope')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-t>', trouble.open_with_trouble, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require'nvim-web-devicons'.setup {
	-- globally enable different highlight colors per icon (default to true)
	-- if set to false all icons will have the default icon's color
	color_icons = true;
	-- globally enable default icons (default to false)
	-- will get overriden by `get_icons` option
	default = true;
	-- globally enable "strict" selection of icons - icon will be looked up in
	-- different tables, first by filename, and if not found by extension; this
	-- prevents cases when file doesn't have any extension but still gets some icon
	-- because its name happened to match some extension (default to false)
	strict = true;
	-- same as `override` but specifically for overrides by filename
	-- takes effect when `strict` is true
	override_by_extension = {
		["shell"] = {
			icon = "",
			color = "#f1502f",
			name = "ShellScript"
		}
	};
}

