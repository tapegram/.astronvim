-- Customize Treesitter
-- Since AstroNvim v6, nvim-treesitter only downloads parsers; treesitter is configured through AstroCore

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = function(_, opts)
    opts.treesitter = opts.treesitter or {}
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.treesitter.ensure_installed = require("astrocore").list_insert_unique(opts.treesitter.ensure_installed, {
      "lua",
      "vim",
      "yaml",
      "json",
      "bash",
      "sql",
      -- add more arguments for adding more treesitter parsers
    })
  end,
}
