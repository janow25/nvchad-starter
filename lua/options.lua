require "nvchad.options"

-- add yours here!

local opt = vim.opt

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- fix No Name buffer
-- by janow
opt.hidden = false

-- show lsp infos in insert mode
vim.diagnostic.config({
  update_in_insert = true,
})
