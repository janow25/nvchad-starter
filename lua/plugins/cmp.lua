return {
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      return {
        auto_brackets = {}, -- configure any filetype to auto add brackets
        sources = cmp.config.sources({
          { name = "lazydev" },
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "copilot"}
        }, {
          { name = "buffer" },
        }),
      }
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    lazy = false,
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  {
    "saghen/blink.cmp",
    enabled = false,
    optional = true,
    dependencies = { "fang2hou/blink-copilot" },
    opts = {
      sources = {
        default = { "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
      completion = {
        keyword = {
          range = "full",
        },
      },
      keymap = {
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        --["<Up>"] = { "select_prev", "fallback" },
        --["<Down>"] = { "select_next", "fallback" },
      },
    },
  },
}
