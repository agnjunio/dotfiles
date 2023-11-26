-- This is a collection of plugins that are intertwined to create the LSP experience

return {
  -- LSP Client
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  -- LSP Server Manager
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
    cmd = "Mason",
    build = ":MasonUpdate",
  },
  -- Autocmpletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      require('lsp-zero').extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')

      cmp.setup({
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
      })
    end
  },
  -- LSP Config
  {
    'neovim/nvim-lspconfig',
    cmd = {
      'LspInfo',
      'LspInstall',
      'LspStart',
    },
    event = {
      'BufRead',
      'BufWrite',
    },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'williamboman/mason-lspconfig.nvim',
      'lukas-reineke/lsp-format.nvim',
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "icons"
        },
        severity_sort = true,
      },
    },
    config = function(_, opts)
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings to learn available actions
        -- lsp_zero.default_keymaps({buffer = bufnr})

        -- Custom keymaps
        local function args(desc)
          return { buffer = bufnr, remap = false, desc = desc }
        end

        vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.signature_help() end, args("Signature Help"))
        vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, args("Rename"))
        vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, args("Code Action"))
        vim.keymap.set("n", "<F5>", function() vim.lsp.buf.code_action() end, args("Code Action"))
        vim.keymap.set("v", "<leader>a", function() vim.lsp.buf.range_code_action() end, args("Code Action"))
        vim.keymap.set("v", "<F5>", function() vim.lsp.buf.range_code_action() end, args("Code Action"))
        vim.keymap.set("n", "H", function() vim.lsp.buf.hover() end, args("Hover"))

        -- Handled by telescope
        -- vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, args())
        -- vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.definition() end, args())
        -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, args())
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, args("Go To Next"))
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, args("Go To Prev"))

        -- Autoformat
        if client.supports_method('textDocument/formatting') then
          local lsp_format = require('lsp-format')
          lsp_format.setup({})
          lsp_format.on_attach(client)
        end
      end)

      -- LSP Server auto-install
      require('mason-lspconfig').setup({
        ensure_installed = {
          'eslint',
          'gopls',
          'lua_ls',
          'tsserver',
        },
      })

      -- LSP Server configs
      local lspconfig = require('lspconfig')

      lspconfig.eslint.setup {
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            -- command = "EslintFixAll",
          })
        end,
      }

      lspconfig.gopls.setup {}

      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
            workspace = {
              -- Disanble annoying lua message
              checkThirdParty = false,
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      }

      lspconfig.tsserver.setup {
        init_options = {
          preferences = {
            disableSuggestions = true
          }
        }
      }
    end,
  }
}
