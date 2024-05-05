return {
  'ThePrimeagen/harpoon',
  lazy = true,
  keys = {
    { '<leader>fa', function() require("harpoon.mark").add_file() end,        desc = "Add file to Harpoon" },
    { '<C-e>',      function() require("harpoon.ui").toggle_quick_menu() end, desc = "Open Harpoon" },
  },
}
