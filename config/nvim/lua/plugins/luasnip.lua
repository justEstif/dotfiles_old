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
