return {
  'ThePrimeagen/harpoon',
  lazy = true,
  keys = {
    { '<leader>a', function() require("harpoon.mark").add_file() end },
    { '<C-e>',     function() require("harpoon.ui").toggle_quick_menu() end },
  },
}
