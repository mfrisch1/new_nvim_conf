-- :source % to apply settings.

vim.cmd("let g:netrw_liststyle = 3") -- Tree stype for :Explore

-- Setup Options in nvim
local opt = vim.opt -- behaves like :set

opt.relativenumber = true
opt.number = true 

-- tabs and indents 
opt.tabstop = 2 -- 2 spaces for tabs 
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces 
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case on search
opt.smartcase = true -- if mixed case for search, assume case-sensitivity

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

