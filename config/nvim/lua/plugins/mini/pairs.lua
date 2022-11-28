-- Mini pairs
local status_pair, mini_pairs = pcall(require, "mini.pairs")
if not status_pair then
	print("mini.pairs error")
	return
end

mini_pairs.setup({})

