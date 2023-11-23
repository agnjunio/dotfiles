---@diagnostic disable: param-type-mismatch
return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-telescope/telescope-symbols.nvim'

	-- Color schemes
	use 'tanvirtin/monokai.nvim'
	use 'rose-pine/neovim'

	-- Treesitter syntax highlight
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('nvim-treesitter/playground')

	-- Pin windows for quick navigation
	use('ThePrimeagen/harpoon')

	-- Undo tree
	use 'mbbill/undotree'

	-- Git integration
	use 'tpope/vim-fugitive'

	-- Lsp integration
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{
				'williamboman/mason.nvim', -- Optional
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required

			-- Autoformat
			{ 'lukas-reineke/lsp-format.nvim' }, -- I like it
		}
	}

	-- Prettier
	use {
		'MunifTanjim/prettier.nvim',
		requires = {
			{ 'jose-elias-alvarez/null-ls.nvim' }, -- Required
		}
	}

	-- Commenter
	use "terrortylor/nvim-comment"

	-- Diagnostics
	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	}

	-- TMux integration
	use "aserowy/tmux.nvim"

	-- Tree view
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
	}
end)
