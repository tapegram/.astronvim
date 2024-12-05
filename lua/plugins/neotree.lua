---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.filesystem.filtered_items = {
      hide_gitignored = false,
    }
    opts.window = {
      width = 80,
      position = "right",
    }
  end,
}
