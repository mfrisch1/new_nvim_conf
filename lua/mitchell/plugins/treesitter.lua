return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "python",
          "lua",
          "go",
          "bash",
          "json",
          "yaml",
          "markdown",
          "vim",
          "vimdoc",
          "html",
          "css",
          "javascript"
        },
        indent = { enable = true, disable = { "go" }},
        highlight = { enable = true },
        autotag = { enable = true },
        auto_install = true,
      })
    end,
  },
}
