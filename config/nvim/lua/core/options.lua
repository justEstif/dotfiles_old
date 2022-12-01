-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

local options = {
	-- General
	mouse = "a", -- enable mouse support
	clipboard = "unnamedplus", -- Copy/paste to system clipboard
	swapfile = false, -- Don't modify file open in another nvim processs
	completeopt = "menuone,noinsert,noselect", -- Autocomplete options
	joinspaces = false, -- Don't autoinsert two spaces after '.', '?', '!' for join command.
	encoding = "utf-8", -- Display this encoding.
	fileencoding = "utf-8", -- Use this encoding when writing to file.
	viewoptions = "cursor,folds", -- Save/restore just these (with `:{mk,load}view`).
	backspace = "indent,eol,start", -- allow backspace on indent, end of line or insert mode start position

	-- Search
	ignorecase = true, -- Ignore case letters when search
	smartcase = true, -- Ignore lowercase for the whole pattern
	gdefault = true, -- default g flag to search
	showmatch = true, -- Highlight matching parenthesis

	-- Line Number
	relativenumber = true, -- relative numebr
	signcolumn = "yes:1", -- sign column default size

	-- Fold
	foldenable = false, -- don't start folded
	fillchars = { fold = " " },
	foldmethod = "manual",

	-- UI
	wrap = true, -- wrap lines
	linebreak = true, -- Wrap on word boundary
	splitright = true, -- Vertical split to the right
	splitbelow = true, -- Horizontal split to the bottom
	termguicolors = true, -- Enable 24-bit RGB colors
	laststatus = 3, -- Set global statusline
	pumheight = 15, -- pop up menu height
	cursorline = true, -- show cursorline
	showtabline = 0, -- don't show tabline

	-- Tabs, indent
	expandtab = true, -- Use spaces instead of tabs
	shiftwidth = 2, -- Shift 2 spaces when tab
	tabstop = 2, -- 1 tab == 2 spaces
	smartindent = true, -- Autoindent new lines

	-- Memory, CPU
	hidden = true, -- Enable background buffers
	history = 200, -- Remember N lines in history
	synmaxcol = 240, -- Max column for syntax highlight
	updatetime = 300, -- ms to wait for trigger an event
	undofile = true, -- enable persistent undo
	autoread = true,
}

-- Settings Options
for k, v in pairs(options) do
	opt[k] = v
end

-- Disable builtins plugins
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end

local options_append = {
	-- ignore these files in search
	wildignore = {
		"*.zip",
		"*.png",
		"*.jpg",
		"*.gif",
		"*.pdf",
		"*DS_Store*",
		"*/.git/*",
		"*/node_modules/*",
		"*/build/*",
		"package-lock.json",
	},
}

for k, v in pairs(options_append) do
	opt[k]:append(v)
end
