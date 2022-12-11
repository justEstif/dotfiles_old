local status, luasnip = pcall(require, "luasnip")
if not status then
	return
end

-- Load custom typescript snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/" } })
luasnip.filetype_extend("all", { "_" })
