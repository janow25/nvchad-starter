return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {}
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
    eneabled = false,
    config = function()
      -- Uncomment these if you want to use a different mapping for Tab
      -- vim.g.copilot_no_tab_map = true
      -- vim.g.copilot_assume_mapped = true
      -- vim.g.copilot_tab_fallback = ""

      -- Enable Copilot for commit files
      vim.g.copilot_filetypes = {
        ["*"] = true, -- Enable for all filetypes by default
        ["gitcommit"] = true, -- Explicitly enable for git commit messages
        ["markdown"] = true, -- Example: Enable for Markdown files
      }
    end,
  },
}
