local status_ok, devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
	return
end

devicons.setup({
	override_by_extension = {
		["org"] = {
			icon = "",
			name = "ORG",
		},
	},
	default = true,
})
