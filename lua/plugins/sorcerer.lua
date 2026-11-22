-- sorcerer.nvim from the local checkout: scry reviews on save, conjure writes a change where
-- you ask (code action "Conjure here", <Leader>la). The binaries are `cargo install --path
-- crates/scry` and `crates/conjure` from ~/projects/sorcerer, in ~/.cargo/bin.
-- conjure needs `conjure trust` once in each project.
---@type LazySpec
return {
  {
    dir = "~/projects/sorcerer.nvim",
    name = "sorcerer.nvim",
    lazy = false,
    opts = {
      conjure = { enabled = true },
    },
  },
}
