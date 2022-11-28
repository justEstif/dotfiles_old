-----------------------------------------------------------
-- Luasnip configuration file
----------------------------------------------------------
local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	return
end

-- Load custom typescript snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/" } })
luasnip.filetype_extend("all", { "_" })
