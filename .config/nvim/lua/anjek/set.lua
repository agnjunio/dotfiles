local g                  = vim.g   -- Global variables
local opt                = vim.opt -- Set options (global/buffer/windows-scoped)

-- Editor
opt.autoread             = true
opt.mouse                = "a"
opt.clipboard            = 'unnamedplus'               -- Copy/paste to system clipboard
opt.swapfile             = false                       -- Don't use swapfile
opt.completeopt          = 'menuone,noinsert,noselect' -- Autocomplete options
opt.scrolloff            = 8                           -- Always show X lines below and above

-- UI
opt.number               = true     -- Show line number
opt.showmatch            = true     -- Highlight matching parenthesis
opt.foldmethod           = 'marker' -- Enable folding (default 'foldmarker')
opt.colorcolumn          = '80'     -- Line lenght marker at 80 columns
opt.splitright           = true     -- Vertical split to the right
opt.splitbelow           = true     -- Horizontal split to the bottom
opt.ignorecase           = true     -- Ignore case letters when search
opt.smartcase            = true     -- Ignore lowercase for the whole pattern
opt.wrap                 = false    -- Line wrapping
opt.linebreak            = true     -- Wrap on word boundary
opt.termguicolors        = true     -- Enable 24-bit RGB colors
opt.laststatus           = 3        -- Set global statusline

-- Tabs, Indents
opt.expandtab            = true -- Use spaces instead of tabs
opt.shiftwidth           = 2    -- Shift X spaces when tab
opt.softtabstop          = 2
opt.tabstop              = 2    -- 1 tab == X spaces
opt.smartindent          = true -- Autoindent new lines

-- Search
opt.hlsearch             = true
opt.incsearch            = true

-- Disabled plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end
