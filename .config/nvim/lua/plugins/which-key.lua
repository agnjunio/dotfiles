-- This is collection of plugins related to editor

return {
  "folke/which-key.nvim",
  lazy = true,
  cmd = "WhichKey",
  keys = {
    "<leader>",
  },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    defaults = {
      mode = { "n", "v" },
      ["<leader>f"] = { name = "+file/find" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>v"] = { name = "+lsp" },
      ["<leader>vw"] = { name = "+lsp workspace" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
