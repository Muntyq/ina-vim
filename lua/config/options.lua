--Native neovim settings

--Basic Settings
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true --Relative line number
vim.opt.cursorline = true -- Highlight current line
vim.opt.scrolloff = 10 -- Keep 'x' lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 'x' columns right/left of cursor
vim.opt.wrap = false -- Don't wrap lines
vim.opt.cmdheight = 1 -- Command line height
vim.opt.spelllang = { "en", "es" } -- Set language for spellchecking

-- Tab & Indentation
vim.opt.tabstop = 2 -- Tab width
vim.opt.shiftwidth = 2 -- Indent width
vim.opt.softtabstop = 2 -- Soft tab stop
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true -- Copy indent from current lien
vim.opt.grepprg = "rg --vimgrep" -- Use ripgrep if avaible
vim.opt.grepformat = "%f:%l:%c:%m" -- filename, line number, column, content







