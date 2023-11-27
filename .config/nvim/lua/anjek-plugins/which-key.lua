-- This is collection of plugins related to editor

return {
  "folke/which-key.nvim",
  lazy = true,
  cmd = "WhichKey",
  keys = {
    "<leader>",
    { "<F3>", ":WhichKey<CR>", desc = "Open this help" },
  },
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    defaults = {
      mode = { "n", "v" },
      ["<leader>b"] = { name = "+Buffer" },
      ["<leader>bc"] = { name = "+Buffer: Close" },
      ["<leader>bg"] = { name = "+Buffer: Go To" },
      ["<leader>f"] = { name = "+File/Find" },
      ["<leader>g"] = { name = "+Git" },
      ["<leader>v"] = { name = "+LSP" },
      ["<leader>vw"] = { name = "+LSP: Workspace" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
