local status, mkdnflow = pcall(require, "mkdnflow")
if not status then
	return
end

mkdnflow.setup({
	perspective = {
		priority = "root",
		fallback = "current",
		root_tell = "index.md",
		nvim_wd_heel = true,
	},
})
