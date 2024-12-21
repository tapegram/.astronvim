-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  {
    import = "astrocommunity.editing-support.chatgpt-nvim",
    config = function()
      require("chatgpt").setup {
        api_key_cmd = "echo $OPENAI_API_KEY",
        actions_paths = { "~/chatgpt-actions/actions.json" },
      }
    end,
  },
  { import = "astrocommunity.motion.mini-ai" },
  -- { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  -- {
  --   import = "astrocommunity.colorscheme.cyberdream-nvim",
  --   config = function()
  --     require("cyberdream").setup {
  --       transparent = true,
  --       italic_comments = true,
  --       hide_fillchars = true,
  --       borderless_telescope = true,
  --       cache = true,
  --       theme = {
  --         variant = "auto",
  --       },
  --     }
  --   end,
  -- },
  { import = "astrocommunity.scrolling.cinnamon-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.colorscheme.melange-nvim" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.editing-support.copilotchat-nvim" },
  { import = "astrocommunity.editing-support.mini-splitjoin" },
  { import = "astrocommunity.editing-support.text-case-nvim" },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.note-taking.neorg" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  { import = "astrocommunity.search.sad-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
  -- {
  --   import = "astrocommunity.completion.avante-nvim",
  --   opts = {
  --     window = {
  --       width = 50,
  --     },
  --   },
  -- },
  { import = "astrocommunity.recipes.vscode" },
  -- { import = "astrocommunity.workflow.hardtime-nvim" },
  -- { import = "astrocommunity.diagnostics.tiny-inline-diagnostic-nvim" },
  -- { import = "astrocommunity.pack.python" },
  -- {
  --   "m4xshen/smartcolumn.nvim",
  --   opts = {
  --     colorcolumn = 120,
  --     disabled_filetypes = { "help" },
  --   },
  -- },
}
