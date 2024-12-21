-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },

    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = true, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
        showtabline = 0,
        background = "dark", -- sets the default background (light or dark). Can be toggled with <leader>ub
        scrolloff = 50,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        ["<Leader><tab>"] = { ":e#<cr>", desc = "Previous File" },
        ["<Leader>r"] = { ":e<cr>", desc = "Reload File" },
        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<Leader>bD"] = {
          function()
            require("astronvim.utils.status").heirline.buffer_picker(
              function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { name = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        --
        -- Rebind Comment to ; from /
        ["<Leader>/"] = false,
        ["<Leader>;"] = {
          function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Comment line",
        },

        -- Rebind Find Theme to Ts
        ["<Leader>ft"] = false,
        ["<Leader>T"] = { name = "Toggle" },
        ["<Leader>Ts"] = {
          function() require("telescope.builtin").colorscheme { enable_preview = true } end,
          desc = "Find themes",
        },

        -- Shortcut for LSP code actions
        ["<Leader>."] = {
          function() vim.lsp.buf.code_action() end,
          desc = "LSP code action",
        },

        -- Use inc-rename isntead of the default rename behavior
        ["<Leader>lr"] = false,
        ["<Leader>lr"] = {
          function()
            require "inc_rename"
            return ":IncRename " .. vim.fn.expand "<cword>"
          end,
          expr = true,
          desc = "Incremental rename",
        },

        -- Show signature help
        ["<Leader>lh"] = {
          function() vim.lsp.buf.signature_help() end,
          desc = "Signature help",
        },

        -- show hover info (hopefully type)
        ["<Leader>lt"] = {
          function() vim.lsp.buf.hover() end,
          desc = "Show type",
        },

        -- Diagnostic for buffer
        ["<Leader>lE"] = {
          function() require("telescope.builtin").diagnostics { bufnr = 0 } end,
          desc = "Show diagnostics in buffer",
        },

        -- Diagnostic for buffer
        ["<Leader>leb"] = {
          function() require("telescope.builtin").diagnostics { bufnr = 0 } end,
          desc = "Show diagnostics in buffer",
        },

        -- Diagnostic for buffer in project
        ["<Leader>leD"] = {
          function() require("telescope.builtin").diagnostics() end,
          desc = "Show diagnostics in project",
        },

        -- Goto next error in bugger
        ["<Leader>len"] = {
          function() vim.diagnostic.goto_next { bufnr = 0 } end,
          desc = "Next diagnostic in buffer",
        },

        -- Goto prev error
        ["<Leader>lep"] = {
          function() vim.diagnostic.goto_prev { bufnr = 0 } end,
          desc = "Previous diagnostic in buffer",
        },

        ["<Leader>lF"] = {
          function() require("telescope.builtin").quickfix { bufnr = 0 } end,
          desc = "Quick fixes",
        },

        -- Telescope for .git project
        -- https://github.com/nvim-telescope/telescope.nvim/issues/592#issuecomment-789002966kk
        -- Gave spacemacs keybinding for muscle memory reasons.
        ["<Leader>pf"] = {
          function(opts)
            opts = opts or {}
            opts.cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
            require("telescope.builtin").find_files(opts)
          end,
          desc = "Find file in project",
        },
        -- Telescope
        -- Trying to get something similar to swiper -- basically telescope for the current buffer
        -- Using spacemacs keybding for msucle memory.
        -- https://www.reddit.com/r/neovim/comments/prs0zr/comment/hdlb3dk/?utm_source=share&utm_medium=web3x
        -- https://github.com/nvim-telescope/telescope.nvim/issues/762#issuecomment-933036711
        ["<Leader>s"] = { name = "search" },
        ["<Leader>ss"] = {
          function() require("telescope.builtin").current_buffer_fuzzy_find { fuzzy = true, case_mode = ignore_case } end,
          desc = "Search in buffer",
        },
        -- Live search of project
        ["<Leader>sp"] = {
          function() require("telescope.builtin").live_grep { fuzzy = true, case_mode = ignore_case } end,
          desc = "Search in project",
        },
        -- Telescope
        -- Look up buffers!
        ["<Leader>bb"] = false,
        ["<Leader>bb"] = {
          function()
            require("telescope.builtin").oldfiles {
              fuzzy = true,
              case_more = ignore_case,
              cwd_only = true,
            }
          end,
          desc = "Recent files",
        },
        -- GPT
        ["<Leader><C-g>c"] = {
          function() require("chatgpt").openChat() end,
          desc = "Open chat",
        },
        -- ["<Leader><C-g>a"] = {
        --   function() require("chatgpt").run_action() end,
        --   desc = "Run action",
        -- },
        ["<Leader><C-g>p"] = {
          function() require("chatgpt").selectAwesomePrompt() end,
          desc = "Open chat with awesome prompt",
        },
        -- ["<Leader><C-g>C"] = {
        --   function() require("chatgpt").complete_code() end,
        --   desc = "Complete code",
        -- },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
      v = {
        -- Rebind Comment to ; from /
        ["<Leader>/"] = false,
        ["<Leader>;"] = {
          "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
          desc = "Toggle comment line",
        },
        -- Shortcut for LSP code actions
        ["<Leader>."] = {
          function() vim.lsp.buf.code_action() end,
          desc = "LSP code action",
        },
        -- Chat GPT actions
        -- https://github.com/jackMort/ChatGPT.nvim?tab=readme-ov-file#chatgpteditwithinstructions
        ["<Leader><C-g>e"] = {
          function() require("chatgpt").edit_with_instructions() end,
          desc = "GPT Edit with instructions",
        },
        ["<Leader><C-g>g"] = {
          "<cmd>ChatGPTRun generate_mappings<CR>",
          desc = "Generate mappings",
        },
        ["<Leader>a"] = { name = "Avante" },
        ["<Leader>ac"] = {
          function()
            require("avante.api").ask {
              question = [[
              Given the selected code, which is either an interface, an abstraction, or some number of unimplemented functions and types 

              Implement a concrete version of the interface or abstraction, or implement the stubbed code as appropriate.

              Do so in an idiomatic way based on the language, and ensure that the code is correct and complete.

              The code should be well-structured, easy to read, and easy to test.

              The code should be written in a way that reflects the code style of the existing codebase.

              Additionally, you should prefer writing code that:

              - Is functional and immutable, where possible and appropriate
              - Separates pure and impure behaviors into separate functions, which are then composed
              - Explicitly handles failures
              - Relies on principles such as SOLID, Ports and Adapters, Domain Driven Design, and 'Parse, Don't Validate'
              - Code should be kept at the same level of abstraction with a single function (as is recommended in Clean Code principles)
            ]],
            }
          end,
          desc = "Implement an interface or stub",
        },
        ["<Leader>ap"] = {
          function()
            require("avante.api").ask {
              question = [[
              Refactor the given code into smaller component functions, types, and/or classes, as appropriate.

              In particular, emphasize separating impure functions (those with side effects) from pure functions, which are deterministic. 

              Then recompose these units of code so the original behavior is unchanged.

              All code should be written into in the same file, but grouped so they can easily be split into separate files manually
            ]],
            }
          end,
          desc = "Purify",
        },
      },
    },
  },
}
