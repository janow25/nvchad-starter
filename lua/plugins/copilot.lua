return {
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup {}
  --   end,
  -- },
  {
    "github/copilot.vim",
    lazy = false,
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
        -- Add more filetypes here if needed
      }

      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see Copilot mapping section

      vim.api.nvim_create_autocmd("User", {
        pattern = "BlinkCmpMenuOpen",
        callback = function()
          local ok, copilot = pcall(require, "copilot.suggestion")
          if ok and copilot then
            copilot.dismiss()
            vim.b.copilot_suggestion_hidden = true
          end
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "BlinkCmpMenuClose",
        callback = function()
          vim.b.copilot_suggestion_hidden = false
        end,
      })
    end,
  },
  {
    "saghen/blink.cmp",
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
