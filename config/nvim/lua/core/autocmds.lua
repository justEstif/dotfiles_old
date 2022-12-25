local augroup = require("core.utils").augroup
local aucmd = require("core.utils").aucmd

augroup("SmartTextYankPost", function(g)
	aucmd("TextYankPost", {
		group = g,
		pattern = "*",
		desc = "Highlight yanked text",
		callback = function()
			vim.highlight.on_yank({
				higroup = "IncSearch",
				timeout = "200",
			})
		end,
	})
end)

augroup("NewlineNoAutoComments", function(g)
	aucmd("BufEnter", {
		group = g,
		pattern = "*",
		command = "setlocal formatoptions-=o",
	})
end)

augroup("DisableCmpInCmdLine", function(g)
	aucmd("CmdWinEnter", {
		group = g,
		pattern = "*",
		callback = function()
			require("cmp").setup({ enabled = false })
		end,
	})
	aucmd("CmdWinLeave", {
		group = g,
		pattern = "*",
		callback = function()
			require("cmp").setup({ enabled = true })
		end,
	})
end)
