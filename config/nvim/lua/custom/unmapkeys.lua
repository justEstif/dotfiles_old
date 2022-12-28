local unmap = require("core.utils").unmap

local keys = {
	"<up>",
	"<left>",
	"<down>",
	"<right>",
	",",
	" ",
	"K",
	"<bs>",
	";",
	"<C-j>",
	"<C-p>",
	"<C-m>",
	"<C-n>",
	"+",
	"-",
	"[#",
	"]#",
	"gk",
	"gj",
	"g<Down>",
	"ge",
	"gE",
	"gw",
	"gW",
	"g~",
	"gh",
	"gl",
	"gJ",
	"gL",
	"g/",
}

for _, key in pairs(keys) do
	pcall(unmap, "n", key)
end
