-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

-- Avante prefix
--
local prefix = "<Leader>a"

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    config = function() require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/projects/snippets" } } end,
  },
  -- {
  --   "echasnovski/mini.animate",
  --   opts = {
  --     open = {
  --       enable = false,
  --     },
  --     close = {
  --       enable = false,
  --     },
  --   },
  -- },
  {
    "Verf/deepwhite.nvim",
    lazy = false,
    priority = 1000,
    config = function() vim.cmd [[colorscheme deepwhite]] end,
  },
  {
    "yetone/avante.nvim",
    build = vim.fn.has "win32" == 1 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    event = "User AstroFile", -- load on file open because Avante manages it's own bindings
    cmd = {
      "AvanteAsk",
      "AvanteBuild",
      "AvanteEdit",
      "AvanteRefresh",
      "AvanteSwitchProvider",
      "AvanteChat",
      "AvanteToggle",
      "AvanteClear",
    },
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      { "AstroNvim/astrocore", opts = function(_, opts) opts.mappings.n[prefix] = { desc = " Avante" } end },
    },
    opts = {
      windows = {
        width = 50,
      },
      mappings = {
        ask = prefix .. "a",
        edit = prefix .. "e",
        refresh = prefix .. "r",
        focus = prefix .. "f",
        toggle = {
          default = prefix .. "t",
          debug = prefix .. "d",
          hint = prefix .. "h",
          suggestion = prefix .. "s",
          repomap = prefix .. "R",
        },
        diff = {
          next = "]c",
          prev = "[c",
        },
        files = {
          add_current = prefix .. ".",
        },
      },
    },
    specs = { -- configure optional plugins
      { "AstroNvim/astroui", opts = { icons = { Avante = "" } } },
      { -- if copilot.lua is available, default to copilot provider
        "zbirenbaum/copilot.lua",
        optional = true,
        specs = {
          {
            "yetone/avante.nvim",
            opts = {
              provider = "copilot",
              auto_suggestions_provider = "copilot",
            },
          },
        },
      },
      {
        -- make sure `Avante` is added as a filetype
        "MeanderingProgrammer/render-markdown.nvim",
        optional = true,
        opts = function(_, opts)
          if not opts.file_types then opts.filetypes = { "markdown" } end
          opts.file_types = require("astrocore").list_insert_unique(opts.file_types, { "Avante" })
        end,
      },
      {
        -- make sure `Avante` is added as a filetype
        "OXY2DEV/markview.nvim",
        optional = true,
        opts = function(_, opts)
          if not opts.filetypes then opts.filetypes = { "markdown", "quarto", "rmd" } end
          opts.filetypes = require("astrocore").list_insert_unique(opts.filetypes, { "Avante" })
        end,
      },
    },
  },
  {
    "ggandor/leap.nvim",
    opts = {
      safe_labels = {},
      -- highlight_unlabeled_phase_one_targets = true,
    },
    -- config = function()
    --   vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
    --   -- vim.api.nvim_set_hl(0, "LeapMatch", {
    --   --   fg = "black",
    --   --   bold = true,
    --   --   nocombine = true,
    --   -- })
    -- end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = true,
      -- cache = true,
      terminal_colors = true,
      theme = {
        variant = "default",
        overrides = function(colors)
          return {
            LeapMatch = { fg = colors.fg, bg = colors.magenta },
            -- LeapBackdrop = { fg = colors.bgHighlight },
          }
        end,
      },
      extensions = {
        telescope = true,
        notify = true,
        leap = false,
        mini = true,
        noice = true,
        treesitter = true,
        treesittercontext = true,
      },
    },
  },
  {
    "unisonweb/unison",
    branch = "trunk",
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/editor-support/vim")
      require("lazy.core.loader").packadd(plugin.dir .. "/editor-support/vim")

      -- This function is for configuring a buffer when an LSP is attached
      local on_attach = function(client, bufnr)
        -- Always show the signcolumn, otherwise it would shift the text each time
        -- diagnostics appear/become resolved
        vim.o.signcolumn = "yes"

        -- Update the cursor hover location every 1/4 of a second
        vim.o.updatetime = 250

        -- Disable appending of the error text at the offending line
        vim.diagnostic.config { virtual_text = false }

        -- Enable a floating window containing the error text when hovering over an error
        vim.api.nvim_create_autocmd("CursorHold", {
          buffer = bufnr,
          callback = function()
            local opts = {
              focusable = false,
              close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
              border = "rounded",
              source = "always",
              prefix = " ",
              scope = "cursor",
            }
            vim.diagnostic.open_float(nil, opts)
          end,
        })

        -- This setting is to display hover information about the symbol under the cursor
        vim.keymap.set("n", "K", vim.lsp.buf.hover)
      end

      -- Setup the Unison LSP
      require("lspconfig")["unison"].setup {
        on_attach = on_attach,
      }

      -- This is NVim Autocompletion support
      local cmp = require "cmp"

      -- This function sets up autocompletion
      cmp.setup {

        -- This mapping affects the autocompletion choices menu
        mapping = cmp.mapping.preset.insert(),

        -- This table names the sources for autocompletion
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      }
    end,
    init = function(plugin) require("lazy.core.loader").ftdetect(plugin.dir .. "/editor-support/vim") end,
  },
}
