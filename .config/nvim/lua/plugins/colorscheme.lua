-- This is a collection of plugins related to themes

local function set_colorscheme(colorscheme)
  vim.api.nvim_cmd({
    cmd = "colorscheme",
    args = { colorscheme },
  }, {})
end

return {
  {
    'tanvirtin/monokai.nvim',
    name = 'monokai',
    lazy = true,
    init = function() set_colorscheme("monokai_pro") end,
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = true,
    init = function() set_colorscheme("rose-pine-moon") end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    init = function() set_colorscheme("tokyonight-storm") end,
  },
}
