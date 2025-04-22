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

-- Terminal toggles for MacOS right alt key
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
    vim.api.nvim_win_close(win, true)
  else
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

-- On Control + C in normal mode in terminal do insert and again control + c
map("n", "<C-c>", function()
  if vim.bo.buftype == "terminal" then
    vim.cmd "startinsert"
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, false, true), "n", true)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, false, true), "n", true)
  end
end, { desc = "Control + C in terminal" })

-- Fix broken <leader>v and <leader>h terminal mappings
map("n", "<leader>v", function()
  require("nvterm.terminal").toggle "vertical"
end, { desc = "Toggle vertical terminal" })

map("n", "<leader>h", function()
  require("nvterm.terminal").toggle "horizontal"
end, { desc = "Toggle horizontal terminal" })

-- Add Neogit mappings
map("n", "<leader>gg", function()
  require("neogit").open {}
end, { desc = "Open Neogit" })

map("n", "<leader>gc", function()
  require("neogit").open { "commit" }
end, { desc = "Open Neogit commit" })

map("n", "<leader>gP", function()
  require("neogit").open { "push" }
end, { desc = "Open Neogit push" })

map("n", "<leader>gp", function()
  require("neogit").open { "pull" }
end, { desc = "Open Neogit pull" })

map("n", "<leader>gf", function()
  require("neogit").open { "fetch" }
end, { desc = "Open Neogit fetch" })
