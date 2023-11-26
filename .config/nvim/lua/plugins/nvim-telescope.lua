local builtin

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-symbols.nvim',
  },
  init = function()
    builtin = require("telescope.builtin")
  end,
  keys = {
    { '<C-p>',       function() builtin.find_files() end },
    { '<C-f>',       function() builtin.live_grep() end },
    { '<leader>fg',  function() builtin.git_files() end },
    { '<leader>ff',  function() builtin.buffers() end },
    { '<leader>fh',  function() builtin.oldfiles() end },
    { '<leader>fc',  function() builtin.colorscheme() end },

    -- LSP Key Bindings
    { '<leader>vr',  function() builtin.lsp_references() end },
    { '<leader>vws', function() builtin.lsp_dynamic_workspace_symbols() end },
    { '<leader>vd',  function() builtin.lsp_definitions() end },
    { '<leader>vt',  function() builtin.lsp_definitions() end },
  },

  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
    },
  },
}
