require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Terminal toggles using nvterm
map("n", "<A-h>", function()
  require("nvterm.terminal").toggle "horizontal"
end, { desc = "Toggle horizontal terminal" })

map("n", "<A-v>", function()
  require("nvterm.terminal").toggle "vertical"
end, { desc = "Toggle vertical terminal" })

map("n", "<A-i>", function()
  require("nvterm.terminal").toggle "float"
end, { desc = "Toggle floating terminal" })

-- Terminal toggles using nvterm
map("n", "ª", function()
  require("nvterm.terminal").toggle "horizontal"
end, { desc = "Toggle horizontal terminal" })

map("n", "√", function()
  require("nvterm.terminal").toggle "vertical"
end, { desc = "Toggle vertical terminal" })

map("n", "⁄", function()
  require("nvterm.terminal").toggle "float"
end, { desc = "Toggle floating terminal" })

local function close_if_float()
  local win = vim.api.nvim_get_current_win()
  local win_config = vim.api.nvim_win_get_config(win)

  if win_config.relative ~= "" then
    vim.api.nvim_win_close(win, true) -- just close the floating window
  else
    -- just exit terminal insert mode
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
  end
end

-- Terminal keymaps
map("t", "<Esc>", close_if_float, { desc = "Close floating terminal or exit terminal mode" })
map("t", "jk", close_if_float, { desc = "Close floating terminal or exit terminal mode" })

-- In terminal-normal mode, <Esc> closes the terminal window
map("n", "<Esc>", function()
  if vim.bo.buftype == "terminal" then
    vim.api.nvim_win_close(0, true)
  end
end, { desc = "Close terminal window" })

-- 🔥 Fix broken <leader>v and <leader>h terminal mappings
map("n", "<leader>v", function()
  require("nvterm.terminal").toggle "vertical"
end, { desc = "Toggle vertical terminal" })

map("n", "<leader>h", function()
  require("nvterm.terminal").toggle "horizontal"
end, { desc = "Toggle horizontal terminal" })

-- Copilot Accept with Tab in insert mode
map("i", "<Tab>", "copilot#Accept()", {
  desc = "Copilot Accept with Tab",
  expr = true, -- Make it work as an expression
  silent = true, -- Don't show any output
  noremap = true, -- Prevent remapping
  replace_keycodes = true,
  nowait = true, -- Avoid waiting for more input
})

-- Copilot Accept with <C-l> in insert mode
map("i", "<C-l>", "copilot#Accept()", {
  desc = "Copilot Accept",
  expr = true,
  silent = true,
  noremap = true,
  replace_keycodes = true,
  nowait = true,
})
