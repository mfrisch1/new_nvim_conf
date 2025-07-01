-- :source % to apply settings.

vim.cmd("let g:netrw_liststyle = 3") -- Tree stype for :Explore

-- Setup Options in nvim
local opt = vim.opt -- behaves like :set

opt.relativenumber = true
opt.number = true

-- tabs and indents
opt.tabstop = 2         -- 2 spaces for tabs
opt.shiftwidth = 2      -- 2 spaces for indent width
opt.expandtab = false   -- expand tab to spaces
opt.autoindent = true   -- copy indent from current line when starting new one
opt.smartindent = false -- let treesitter handle this
opt.formatoptions = opt.formatoptions - { "c", "r", "o" }  -- disables auto commenting on newline

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case on search
opt.smartcase = true  -- if mixed case for search, assume case-sensitivity

-- colouring
opt.background = "dark"
opt.signcolumn = "yes" -- special space for icons to appear on the side, yes will always keep a column for it.

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clupboard as default register

-- split windows
opt.splitright = true -- verticle window to the right
opt.splitbelow = true -- horizontal window to bottom

-- Go indent settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.indentexpr = ""
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
    vim.opt_local.expandtab = false
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end
})

