-- The telescope import in community.lua turns snacks.picker off. Turn it back on only so that
-- vim.ui.select (code actions, `gra`) is a searchable picker rather than noice's numbered prompt;
-- the telescope mappings stay as they are.
---@type LazySpec
return {
  "folke/snacks.nvim",
  opts = { picker = { enabled = true, ui_select = true } },
}
