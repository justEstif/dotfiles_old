return function(files)
	local function open_file_in_split(close, vertical)
		return function()
			local is_file = files.get_fs_entry().fs_type == "file"
			if is_file then
				vim.api.nvim_win_call(files.get_target_window(), function()
					vim.cmd.split({ mods = { split = "belowright", vertical = vertical } })
					files.set_target_window(vim.api.nvim_get_current_win())
				end)
			end

			files.go_in()
			if close and is_file then
				files.close()
			end
		end
	end

	vim.api.nvim_create_autocmd("User", {
		pattern = "MiniFilesBufferCreate",
		callback = function(args)
			local buf_id = args.data.buf_id

			vim.api.nvim_buf_set_keymap(buf_id, "n", "<C-s>", "", {
				callback = open_file_in_split(true, true),
				desc = "Open file in vertical split and close file browser",
			})

			vim.api.nvim_buf_set_keymap(buf_id, "n", "<C-w>s", "", {
				callback = open_file_in_split(false),
				desc = "Open file in horizontal split",
			})

			vim.api.nvim_buf_set_keymap(buf_id, "n", "<C-w>v", "", {
				callback = open_file_in_split(false, true),
				desc = "Open file in vertical split",
			})

			vim.api.nvim_buf_set_keymap(buf_id, "n", "<C-x>", "", {
				callback = open_file_in_split(true),
				desc = "Open file in horizontal split and close file browser",
			})
		end,
	})
end
