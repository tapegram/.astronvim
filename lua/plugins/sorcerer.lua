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
    -- Neovim started from a launcher lacks the shell PATH: scry and conjure live in
    -- ~/.cargo/bin, and conjure calls `claude` from ~/.local/bin.
    init = function()
      for _, dir in ipairs { "~/.local/bin", "~/.cargo/bin" } do
        dir = vim.fn.expand(dir)
        if not vim.env.PATH:find(dir, 1, true) then vim.env.PATH = dir .. ":" .. vim.env.PATH end
      end
    end,
    -- <leader>ma lists the line's code actions: spellbook's fixes first, then conjure's.
    keys = { { "<leader>ma", function() vim.lsp.buf.code_action() end, desc = "code actions (sorcerer)" } },
    opts = {
      conjure = { enabled = true },
      spellbook = { enabled = true },
    },
  },
}
