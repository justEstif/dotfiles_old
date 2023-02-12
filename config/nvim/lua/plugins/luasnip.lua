local status, luasnip = pcall(require, "luasnip")
if not status then
	return
end
luasnip.config.set_config({ history = true })

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/" } })
luasnip.filetype_extend("all", { "_" })

local map = require("core.utils").map
map({ "i", "s" }, "<C-l>", function()
	require("luasnip").jump(1)
end, { desc = "jump in snippet" })
map({ "i", "s" }, "<C-h>", function()
	require("luasnip").jump(-1)
end, { desc = "jump in snippet" })
