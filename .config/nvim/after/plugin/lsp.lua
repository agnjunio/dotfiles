local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')
local cmp = require('cmp')

lsp.preset('recommended')

lsp.ensure_installed({
  'eslint',
  'gopls',
  'lua_ls',
  'tsserver',
})

lsp.on_attach(function(client, bufnr)
  -- Custom keymaps
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)
  vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

  -- Autoformat
  if client.supports_method('textDocument/formatting') then
    require('lsp-format').on_attach(client)
  end
end)

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
})

lspconfig.eslint.setup {
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
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

-- Configure null_ls to support other plugins like prettier
require("null-ls").setup()

lsp.setup()
