-- Mini jump2d
local status_jump2d, mini_jump2d = pcall(require, "mini.jump2d")
if not status_jump2d then
	print("mini.jump2d error")
	return
end

mini_jump2d.setup({
	mappings = {
		start_jumping = "<BS>",
	},
})


