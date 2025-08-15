return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = function()
      local mocha = require("catppuccin.palettes").get_palette "mocha"

      -- -- Example for mocha:
      vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = mocha.red, bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = mocha.peach, bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = mocha.yellow, bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = mocha.green, bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = mocha.teal, bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = mocha.sapphire, bold = true })

      require("render-markdown").setup {
        completions = { blink = { enabled = true } },
        heading = {
          position = "inline",
          icons = { "1. ", "2. ", "3. ", "4. ", "5. ", "6. " },
          foregrounds = {
            "RenderMarkdownH1",
            "RenderMarkdownH2",
            "RenderMarkdownH3",
            "RenderMarkdownH4",
            "RenderMarkdownH5",
            "RenderMarkdownH6",
          },
          backgrounds = {
            "RenderMarkdownH1",
            "RenderMarkdownH2",
            "RenderMarkdownH3",
            "RenderMarkdownH4",
            "RenderMarkdownH5",
            "RenderMarkdownH6",
          },
        },
      }
    end,
    ft = { "markdown" },
  },
}
