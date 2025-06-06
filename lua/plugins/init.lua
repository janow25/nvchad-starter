return {
  {
    "NvChad/nvterm",
    lazy = false,
    config = function()
      require("nvterm").setup()
    end,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  { import = "nvchad.blink.lazyspec" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "python",
        "html",
        "css",
        "json",
        "bash",
        "csv",
        "dockerfile",
        "helm",
        "markdown",
        "yaml",
        "xml",
        "rust", 
      },
      highlight = {
        enable = true,
        disable = { "objectscript", "dockerfile" },
      },
    },
  },
  {
    "towolf/vim-helm",
    ft = "helm"
  },
}
