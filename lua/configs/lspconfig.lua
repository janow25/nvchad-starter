local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

nvlsp.defaults() -- Load NvChad's default LSP settings

-- Individual LSP configurations
lspconfig.html.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

lspconfig.cssls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

lspconfig.jsonls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

lspconfig.bashls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "sh" },
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command)",
    },
  },
}

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Dockerfile LSP
lspconfig.dockerls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "dockerfile" },}

-- Rust Analyzer with custom settings
lspconfig.rust_analyzer.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern("Cargo.toml"),
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = false, -- Disable diagnostics
      },
    },
  },
}

-- Register custom server only if not already done
if not configs.intersystems_ls then
  configs.intersystems_ls = {
    default_config = {
      cmd = { "/Users/janow/Developer/iris-lsp/darwin-x86_64/intersystems-ls" },
      filetypes = { "objectscript", "objectscript_class" },
      root_dir = function(fname)
        return util.root_pattern("*.cls")(fname) or util.find_git_ancestor(fname)
      end,
      settings = {
        objectscript = {
          conn = {
            active = true,
            host = "localhost",
            ns = "USER",
            superPort = 1972,
            username = "_SYSTEM",
            password = "SYS"
          }
        }
      },
    },
  }
end

lspconfig.intersystems_ls.setup{
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "objectscript", "objectscript_class" },

}
