return {
  'tanvirtin/monokai.nvim',
  name = 'monokai',
  lazy = false,
  init = function()
    vim.api.nvim_cmd({
      cmd = "colorscheme",
      args = { "monokai_pro" },
    }, {})
  end
}
