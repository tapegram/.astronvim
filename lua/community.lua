-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- AstroNvim v5+ defaults to snacks.picker and blink.cmp; keep telescope and nvim-cmp
  { import = "astrocommunity.fuzzy-finder.telescope-nvim" },
  { import = "astrocommunity.completion.nvim-cmp" },
  -- {
  --   import = "astrocommunity.editing-support.chatgpt-nvim",
  --   config = function()
  --     require("chatgpt").setup {
  --       api_key_cmd = "echo $OPENAI_API_KEY",
  --       actions_paths = { "~/chatgpt-actions/actions.json" },
  --     }
  --   end,
  -- },
  { import = "astrocommunity.pack.haskell" },
  { import = "astrocommunity.color.tint-nvim" },
  { import = "astrocommunity.motion.before-nvim" },
  { import = "astrocommunity.motion.vim-matchup" },
  { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" },
  { import = "astrocommunity.split-and-window.colorful-winsep-nvim" },
  { import = "astrocommunity.split-and-window.windows-nvim" },
  {
    import = "astrocommunity.colorscheme.catppuccin",
    opts = {
      transparent_background = true,
    },
  },
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.colorscheme.melange-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-paper-nvim" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- { import = "astrocommunity.completion.codex-nvim" },
  -- { import = "astrocommunity.editing-support.copilotchat-nvim" },
  { import = "astrocommunity.editing-support.mini-splitjoin" },
  { import = "astrocommunity.editing-support.text-case-nvim" },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  -- Not the whole pack folder: lazy imports every submodule of it, which also turned on
  -- pyrefly and ty beside basedpyright (three answers to every gd).
  { import = "astrocommunity.pack.python.base" },
  { import = "astrocommunity.pack.python.basedpyright" },
  { import = "astrocommunity.pack.python.black" },
  { import = "astrocommunity.pack.python.isort" },
  { import = "astrocommunity.pack.python.ruff" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  { import = "astrocommunity.search.sad-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.motion.marks-nvim" },
  { import = "astrocommunity.pack.biome" },
  -- { import = "astrocommunity.workflow.hardtime-nvim" },
  -- { import = "astrocommunity.diagnostics.tiny-inline-diagnostic-nvim" },
}
