return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },

      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-tree/nvim-web-devicons",
    },

    cmd = "Telescope",
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end,                                                       desc = "Find files" },
      { "<leader>fg", function() require("telescope").extensions.live_grep_args.live_grep_args() end,                                  desc = "Live grep args" },
      { "<leader>fG", function() require("telescope.builtin").live_grep() end,                                                        desc = "Live grep" },
      { "<leader>bb", function() require("telescope.builtin").buffers() end,                                                          desc = "Buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end,                                                        desc = "Help" },
      { "<leader>fd", function() require("telescope.builtin").diagnostics() end,                                                      desc = "Diagnostics" },
      { "<leader>fr", function() require("telescope.builtin").resume() end,                                                           desc = "Resume" },
      { "gd",         function() require("telescope.builtin").lsp_definitions() end,                                                  desc = "Go to definitions" },
      { "gr",         function() require("telescope.builtin").lsp_references({ include_declaration = false, show_line = false }) end, desc = "Go to references" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local lga_actions = require("telescope-live-grep-args.actions")

      local picker_opts = {
        sort_mru = true,
        ignore_current_buffer = true,
        path_display = { "truncate" },
      }

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-f>"] = actions.preview_scrolling_down,
              ["<C-b>"] = actions.preview_scrolling_up,
            },
            n = {
              ["<C-f>"] = actions.preview_scrolling_down,
              ["<C-b>"] = actions.preview_scrolling_up,
            }
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          ["ui-select"] = require("telescope.themes").get_dropdown({}),
          live_grep_args = {
            auto_quoting = false,
            mappings = {
              i = {
                ["<C-g>"] = lga_actions.quote_prompt({ postfix = " --glob " }),
              },
            },
          },
        },
        pickers = {
          find_files = picker_opts,
          live_grep = picker_opts,
          buffers = vim.tbl_deep_extend("force", picker_opts, {
            mappings = {
              i = { ["<C-d>"] = actions.delete_buffer },
              n = { ["<C-d>"] = actions.delete_buffer },
            }
          }),
        }
      })

      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "ui-select")
      pcall(telescope.load_extension, "live_grep_args")
    end,
  },
}
