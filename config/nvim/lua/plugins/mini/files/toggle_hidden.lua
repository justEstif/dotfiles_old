return function(files)
	local show_hidden = true

	local filter_show = function()
		return true
	end

	local filter_hide = function(fs_entry)
		return not (vim.startswith(fs_entry.name, ".") or (fs_entry.name == "node_modules"))
	end

	local toggle_hidden = function()
		show_hidden = not show_hidden
		local new_filter = show_hidden and filter_show or filter_hide
		files.refresh({ content = { filter = new_filter } })
	end

	vim.api.nvim_create_autocmd("User", {
		pattern = "MiniFilesBufferCreate",
		callback = function(args)
			local buf_id = args.data.buf_id
			vim.keymap.set("n", "g.", toggle_hidden, { buffer = buf_id, desc = "Toggle hidden files" })
		end,
	})
end
