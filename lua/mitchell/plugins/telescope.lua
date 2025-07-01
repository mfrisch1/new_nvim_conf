return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = vim.fn.executable("make") == 1,
    }

  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mapping = {
          i = {  -- Insert mode mappings
            ["<C-n>"] = require("telescope.actions").move_selection_next,
            ["<C-p>"] = require("telescope.actions").move_selection_previous,
            ["<C-q>"] = function(prompt_bufnr)
              actions.send_selected_to_qflist(prompt_bufnr)
              actions.open_qflist(prompt_bufnr)
          end,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    local keymap = vim.keymap
    local builtin = require('telescope.builtin')
    keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  end,
}
