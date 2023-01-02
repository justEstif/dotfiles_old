local status, luasnip = pcall(require, "luasnip")
if not status then
	return
end
luasnip.config.set_config({ history = true })

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/" } })
luasnip.filetype_extend("all", { "_" })

-- Make snippet keymaps
local map = require("core.utils").map
local luasnip_go_right = function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end

local luasnip_go_left = function()
	if luasnip.jumpable() then
		luasnip.jump(-1)
	end
end

map({ "i", "s" }, "<C-l>", function()
	luasnip_go_right()
end, {})

map({ "i", "s" }, "<C-h>", function()
	luasnip_go_left()
end, {})

-- Autocmds
local augroup = require("core.utils").augroup
local aucmd = require("core.utils").aucmd

local luasnip_ns = vim.api.nvim_create_namespace("luasnip")

local luasnip_notify_clear = function()
	vim.api.nvim_buf_clear_namespace(0, luasnip_ns, 0, -1)
end

local luasnip_notify = function()
	if not luasnip.expandable() then
		luasnip_notify_clear()
		return
	end

	local line = vim.api.nvim_win_get_cursor(0)[1] - 1
	vim.api.nvim_buf_set_virtual_text(0, luasnip_ns, line, { { "!", "Special" } }, {})
end

augroup("IndicateSnippets", function(g)
	aucmd({
		"InsertEnter",
		"CursorMovedI",
		"TextChangedI",
		"TextChangedP",
	}, {
		group = g,
		pattern = "*",
		callback = function()
			luasnip_notify()
		end,
	})

	aucmd({
		"InsertLeave",
	}, {
		group = g,
		pattern = "*",
		callback = function()
			luasnip_notify_clear()
		end,
	})
end)
