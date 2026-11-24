return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs                        = {
      add          = { text = '┃' },
      change       = { text = '┃' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signs_staged                 = {
      add          = { text = '┃' },
      change       = { text = '┃' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signs_staged_enable          = true,
    signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                 = {
      follow_files = true
    },
    auto_attach                  = true,
    attach_to_untracked          = false,
    current_line_blame           = true,  -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts      = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    sign_priority                = 6,
    update_debounce              = 100,
    status_formatter             = nil,   -- Use default
    max_file_length              = 40000, -- Disable if file is longer than this (in lines)
    preview_config               = {
      -- Options passed to nvim_open_win
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },
    on_attach                    = function(bufnr)
      local gitsigns = require('gitsigns')

      local function map(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
      end

      map(']h', function() gitsigns.nav_hunk('next') end, 'Next git hunk')
      map('[h', function() gitsigns.nav_hunk('prev') end, 'Previous git hunk')
      map('<leader>hp', gitsigns.preview_hunk_inline, 'Preview git hunk inline')

      -- Overlay the diff on the buffer itself so LSP navigation keeps working
      map('<leader>gd', function()
        gitsigns.toggle_word_diff(gitsigns.toggle_linehl())
      end, 'Toggle git diff highlight')

      -- Compare against the merge-base so the diff matches what a PR would show
      map('<leader>gb', function()
        vim.ui.input({ prompt = 'Diff base: ', default = 'origin/main' }, function(rev)
          if not rev or rev == '' then
            return
          end
          local dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':h')
          local merge_base = vim.fn.systemlist({ 'git', '-C', dir, 'merge-base', 'HEAD', rev })[1]
          gitsigns.change_base(vim.v.shell_error == 0 and merge_base or rev, true)
        end)
      end, 'Change git diff base')
      map('<leader>gB', function() gitsigns.reset_base(true) end, 'Reset git diff base')

      map('<leader>gl', function() gitsigns.setqflist('all') end, 'List git hunks in quickfix')
    end,
  }
}
