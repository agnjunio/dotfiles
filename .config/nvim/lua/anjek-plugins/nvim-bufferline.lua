-- Bufferline is a plugin to extend and manage buffers for a tab-like experience

return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = "BufRead",
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      hover = {
        enabled = true,
        delay = 500,
        reveal = { 'close' },
      },
      separator_style = { "", " " },
      -- separator_style = "slope",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true, -- use "true" for default, or set your own character
        },
      }
    },
    highlights = {
      -- selected item
      -- | before file
      indicator_selected = {
        bg = { attribute = "fg", highlight = "LineNr" },
        fg = { attribute = "fg", highlight = "Conditional" },
      },
      -- prefix path
      duplicate_selected = {
        bg = { attribute = "fg", highlight = "LineNr" },
        fg = { attribute = "fg", highlight = "Normal" },
      },
      buffer_selected = { -- file name
        bg = { attribute = "fg", highlight = "LineNr" },
      },
      -- eslint errors
      error_selected = {
        bg = { attribute = "fg", highlight = "LineNr" },
        fg = { attribute = "fg", highlight = "Error" },
      },
      warning_selected = {
        bg = { attribute = "fg", highlight = "LineNr" },
        fg = { attribute = "fg", highlight = "Warning" },
      },
      close_button_selected = { -- X after file
        bg = { attribute = "fg", highlight = "LineNr" },
      },
      -- buffer modified mark
      modified_selected = {
        bg = { attribute = "fg", highlight = "LineNr" },
      },
      separator = {
        fg = { attribute = "fg", highlight = "LineNr" },
      },
    },
  },
  keys = {
    { "<C-S-PageUp>",   ":BufferLineMovePrev<CR>",     desc = "Buffer: Swap with Previous" },
    { "<C-S-PageDown>", ":BufferLineMoveNext<CR>",     desc = "Buffer: Swap with Next" },
    { "<leader>bcc",    ":bd<CR>",                     desc = "Buffer: Close Current" },
    { "<leader>bca",    ":BufferLineCloseLeft<CR>",    desc = "Buffer: Close Left" },
    { "<leader>bcd",    ":BufferLineCloseRight<CR>",   desc = "Buffer: Close Right" },
    { "<leader>bco",    ":BufferLineCloseOthers<CR>",  desc = "Buffer: Close Others" },
    { "<leader>bg1",    ":BufferLineGoToBuffer 1<CR>", desc = "Buffer: Go To Buffer 1" },
    { "<leader>bg2",    ":BufferLineGoToBuffer 2<CR>", desc = "Buffer: Go To Buffer 2" },
    { "<leader>bg3",    ":BufferLineGoToBuffer 3<CR>", desc = "Buffer: Go To Buffer 3" },
    { "<leader>bg4",    ":BufferLineGoToBuffer 4<CR>", desc = "Buffer: Go To Buffer 4" },
    { "<leader>bg5",    ":BufferLineGoToBuffer 5<CR>", desc = "Buffer: Go To Buffer 5" },
    { "<leader>bg6",    ":BufferLineGoToBuffer 6<CR>", desc = "Buffer: Go To Buffer 6" },
    { "<leader>bg7",    ":BufferLineGoToBuffer 7<CR>", desc = "Buffer: Go To Buffer 7" },
    { "<leader>bg8",    ":BufferLineGoToBuffer 8<CR>", desc = "Buffer: Go To Buffer 8" },
    { "<leader>bg9",    ":BufferLineGoToBuffer 9<CR>", desc = "Buffer: Go To Buffer 9" },
  }
}
