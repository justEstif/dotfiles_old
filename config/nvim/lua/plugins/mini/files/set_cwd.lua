return function(files)
	local files_set_cwd = function(path)
		-- Works only if cursor is on the valid file system entry
		local cur_entry_path = files.get_fs_entry().path
		local cur_directory = vim.fs.dirname(cur_entry_path)
		vim.fn.chdir(cur_directory)
	end

	vim.api.nvim_create_autocmd("User", {
		pattern = "MiniFilesBufferCreate",
		callback = function(args)
			vim.keymap.set(
				"n",
				"g~",
				files_set_cwd,
				{ buffer = args.data.buf_id, desc = "Set current working directory" }
			)
		end,
	})
end
