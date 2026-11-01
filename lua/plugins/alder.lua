-- alder.nvim from the local checkout, for manual testing (M6a, then M6b plan 1: alder lsp).
-- The grammar comes from the local alder checkout, and the CLI is the branch build in
-- ~/go/bin: /opt/homebrew/bin/alder (0.1.0) has neither `help --json` nor `lsp`.
-- astrolsp is a dependency so its LspAttach handler (gd, K, <Leader>l…) exists before
-- alder.nvim starts `alder lsp` on the first .alder buffer. Completion comes from nvim-cmp.
-- nui.nvim draws the generator modal (<leader>ag, M6b plan 2).
---@type LazySpec
return {
  {
    dir = "~/projects/alder.nvim",
    name = "alder.nvim",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "AstroNvim/astrolsp", "MunifTanjim/nui.nvim" },
    opts = {
      cmd = vim.fn.expand "~/go/bin/alder",
      path = "~/projects/alder",
    },
  },
}
