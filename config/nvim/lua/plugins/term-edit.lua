local status, term = pcall(require, "term-edit")
if not status then
	print("term-edit error")
	return
end

term.setup({
	prompt_end = "%$ ",
})
