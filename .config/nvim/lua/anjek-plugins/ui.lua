-- A set of plugins related to ui

return {
  -- Greeter
  {
    'goolord/alpha-nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end,
  },

  -- Indent lines with scope highlight
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufRead",
    opts = {
      indent = {
        char = "│",
      },
      scope = {
        enabled = false
      },
    },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
  {
    "echasnovski/mini.indentscope",
    version = false,
    event = "BufRead",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  -- Revamp messages, cmdline and popupmenus
  {
    "folke/noice.nvim",
    event = "BufRead",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      presets = {
        bottom_search = true,          -- use a classic bottom cmdline for search
        command_palette = false,       -- position the cmdline and popupmenu together
        long_message_to_split = false, -- long messages will be sent to a split
        inc_rename = false,            -- enables an input dialog for inc-rename.nvim
      },
      routes = {
        { view = "cmdline", filter = { event = "msg_showmode" } },                                           -- Show recording in notify
        { view = nil,       filter = { event = "msg_show", kind = "search_count" }, opts = { skip = true } } -- Hide search text
      },
      views = {
        cmdline_popup = {
          position = {
            row = 2,
            col = "50%",
          },
          size = {
            width = 100,
            height = "auto",
          }
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 100,
            height = "50%",
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" }
          }
        }
      },
    },
  }
}
