-- This is a collection of plugins related to coding

return {
  {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find("Windows"))
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
        or nil,
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    keys = {
      {
        "<Tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<Tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      { "<Tab>",   function() require("luasnip").jump(1) end,  mode = "s" },
      { "<S-Tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },

  -- ()""{} pairs :)
  {
    "echasnovski/mini.pairs",
    lazy = false,
    opts = {},
  },

  -- Comments
  {
    "b3nj5m1n/kommentary",
    keys = {
      { "<leader>/", "<Plug>kommentary_line_default",   mode = "n", desc = "Comment Line" },
      { "<C-_>",     "<Plug>kommentary_line_default",   mode = "n", desc = "Comment Line" },
      { "<C-/>",     "<Plug>kommentary_line_default",   mode = "n", desc = "Comment Line" },
      { "<leader>/", "<Plug>kommentary_visual_default", mode = "v", desc = "Comment Line(s)" },
      { "<C-_>",     "<Plug>kommentary_visual_default", mode = "v", desc = "Comment Line(s)" },
      { "<C-/>",     "<Plug>kommentary_visual_default", mode = "v", desc = "Comment Line(s)" },
    },
  }
}
