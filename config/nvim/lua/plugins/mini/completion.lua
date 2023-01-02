local status_completion, mini_completion = pcall(require, "mini.completion")
if not status_completion then
	return
end

mini_completion.setup({
	source_func = "omnifunc",
	auto_setup = true,
})
