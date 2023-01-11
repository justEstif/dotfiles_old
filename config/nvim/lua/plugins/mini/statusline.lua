local status, statusline = pcall(require, "mini.statusline")
if not status then
	print("mini.statusline error")
	return
end

statusline.setup({
	content = {
		active = function()
			local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
			local filename = statusline.section_filename({ trunc_width = 140 })
			local fileinfo = statusline.section_fileinfo({ trunc_width = 320 })

			return statusline.combine_groups({
				{ hl = "MiniStatuslineDevinfo", strings = { diagnostics } },
				"%<", -- Mark general truncate point
				{ hl = "MiniStatuslineFilename", strings = { filename } },
				"%=", -- End left alignment
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
			})
		end,
	},
})
