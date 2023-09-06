local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-- General
opt.swapfile = false -- Don't modify file open in another nvim processs
opt.iskeyword:append("-") -- Treat dash separated words as a word text object
-- opt.mouse = "a" -- enable mouse support
-- opt.encoding = "utf-8" -- Display this encoding.
-- opt.fileencoding = "utf-8" -- Use this encoding when writing to file.
-- opt.wrap = true -- wrap long lines

-- completion
opt.completeopt = "menuone,noinsert,noselect" -- Customize completions
opt.switchbuf = "usetab"

-- case-insenstive, unless it has uppercase
opt.ignorecase = true
opt.infercase = true
opt.smartcase = true

-- pop-up menu ui
opt.pumheight = 10 -- pop up menu height
opt.pumblend = 10 -- slight transparent

-- UI
opt.cursorline = true -- show cursorline
opt.relativenumber = true -- show relativenumber
opt.number = true
opt.signcolumn = "yes:1" -- sign column default size
opt.conceallevel = 0 -- `` is visible in markdown files
opt.termguicolors = true -- enable gui colors
-- opt.scrolloff = 5

-- new window direction
opt.splitright = true -- Horizontal splits wwill be below
opt.splitbelow = true -- Vertical splits will be to the right

-- fold
opt.fillchars = { fold = " " }
opt.foldmethod = "indent"
opt.foldenable = false
opt.foldlevel = 99
g.markdown_folding = 1 -- enable markdown folding

-- Tabs, indent
opt.expandtab = true -- Convert tabs to spaces
opt.tabstop = 2 -- Insert 2 spaces for a tab
opt.smarttab = true -- Make tabbing smarter (will realize you have 2 vs 4)
opt.shiftwidth = 2 -- Use this number of spaces for indentation
opt.smartindent = true -- Make indenting smart

-- Memory, CPU
opt.hidden = true -- Enable background buffers
opt.history = 200 -- Remember N lines in history
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 300 -- ms to wait for trigger an event
opt.undofile = true -- enable persistent undo
opt.autoread = true -- auto read files changes

-- fix markdown indentation settings
g.markdown_recommended_style = 0

opt.path:remove("/usr/include") -- Better search
opt.path:append("**") -- Better search

-- ignore these files in search
opt.wildignore:append({
	"*.gif",
	"*.jpg",
	"*.pdf",
	"*.png",
	"*.zip",
	"*/.git/*",
	"*/build/*",
	"*/node_modules/*",
	"*DS_Store*",
	"package-lock.json",
})
