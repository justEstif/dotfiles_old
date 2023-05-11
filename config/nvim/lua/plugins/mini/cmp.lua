local status, cmp = pcall(require, "mini.completion")
if not status then
	print("mini.completion error")
	return
end

cmp.setup({
	lsp_completion = {
		source_func = "omnifunc",
		auto_setup = false,
		process_items = function(items, base)
			-- Don't show 'Text' and 'Snippet' suggestions
			items = vim.tbl_filter(function(x)
				return x.kind ~= 1 and x.kind ~= 15
			end, items)
			return cmp.default_process_items(items, base)
		end,
	},
})
