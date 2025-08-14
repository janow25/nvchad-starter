-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

-- Hide Copilot from statusline
-- from: https://github.com/le4ker/NvMegaChad/blob/main/lua/chadrc.lua
local function lsp()
  if rawget(vim, "lsp") then
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do

      local stbufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)

      -- ignore copilot
      if client.attached_buffers[stbufnr] and client.name ~= "GitHub Copilot" then
        return (vim.o.columns > 100 and "%#St_LspStatus#" .. "   LSP ~ " .. client.name .. " ") or "   LSP "
      end
    end
  end
end

M.base46 = {
	theme = "catppuccin",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.nvdash = { load_on_startup = true }

M.ui = {
  statusline = {
    separator_style = "block",
    modules = {
      lsp = lsp,
    },
  },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.spell = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "nvdash",
  callback = function()
    vim.opt.showtabline = 0
  end,
})

vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*",
  callback = function()
    -- Restore tabline when leaving nvdash (if you want it always visible otherwise)
    if vim.opt.showtabline:get() == 0 then
      vim.opt.showtabline = 2
    end
  end,
})

return M
