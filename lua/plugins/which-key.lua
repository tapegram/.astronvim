-- The key hint menu keeps its place at the bottom of the screen. which-key's default
-- (win.no_overlap = true) moves it below the cursor when they would overlap and shrinks it
-- to the rows left (at least 4): with the cursor near the bottom, only its title and
-- footer fit and the keys are cut. Covering the cursor line for a moment is the lesser evil.
---@type LazySpec
return {
  "folke/which-key.nvim",
  opts = { win = { no_overlap = false } },
}
