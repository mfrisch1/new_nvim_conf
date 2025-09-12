return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      "nvim-telescope/telescope-fzf-native.nvim",
			build = function()
				local os_name = vim.loop.os_uname().sysname
				if os_name == "Windows_NT" then
					local cmd = [[
						powershell -NoProfile -Command "
							Remove-Item -Recurse -Force .\build -ErrorAction SilentlyContinue;
							cmake -S . -B build -G 'MinGW Makefiles' -DCMAKE_BUILD_TYPE=Release "-DCMAKE_POLICY_VERSION_MINIMUM=3.5";
							cmake --build build --config Release
						"
					]]
					print("Running build cmd:", cmd)
					os.execute(cmd)
				else
					os.execute("make")
				end
			end
		},
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
				file_ignore_patterns = { "%.git/"},
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
    keymap.set('n', '<leader>ff', function() builtin.find_files({hidden = true, no_ignore = true}) end, { desc = 'Telescope find files' })
    keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  end,
}
