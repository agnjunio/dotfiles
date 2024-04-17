local builtin

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-symbols.nvim',
    'nvim-telescope/telescope-ui-select.nvim', -- Use Telescope for vim.select (Code Actions, etc)
  },
  config = function()
    require("telescope").setup {
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {}
        }
      },
    }
    require("telescope").load_extension("ui-select")
  end,
  init = function()
    builtin = require("telescope.builtin")
  end,
  keys = {
    { '<C-p>',       function() builtin.find_files({ hidden = true }) end,   desc = "Find Files" },
    { '<C-f>',       function() builtin.live_grep() end,                     desc = "Live Grep" },
    { '<leader>fg',  function() builtin.git_files() end,                     desc = "Git files" },
    { '<leader>ff',  function() builtin.buffers() end,                       desc = "Open buffers" },
    { '<leader>fh',  function() builtin.oldfiles() end,                      desc = "History" },
    { '<leader>fc',  function() builtin.colorscheme() end,                   desc = "Color Scheme" },
    { '<leader>fs',  function() builtin.grep_string() end,                   desc = "Find String" },

    -- LSP Key Bindings
    { '<leader>vr',  function() builtin.lsp_references() end,                desc = "LSP References" },
    { '<leader>vws', function() builtin.lsp_dynamic_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    { '<leader>vd',  function() builtin.lsp_definitions() end,               desc = "LSP Definitions" },
    { '<leader>vt',  function() builtin.lsp_definitions() end,               desc = "LSP Definitions" },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 1,
    },
  },
}
