local M = {}

local config = {
	directory = "/notes/",
	file_ext = ".md",
	default_file_name = "index",
}

local create_folder = function()
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*" .. config.directory .. "**/*" .. config.file_ext,
		callback = function()
			local dir = vim.fn.expand("<afile>:p:h")
			if dir:find("%l+://") == 1 then
				return
			end
			if vim.fn.isdirectory(dir) == 0 then
				vim.fn.mkdir(dir, "p")
			end
		end,
	})
end

local create_file = function(file_name)
	vim.cmd("e " .. vim.fn.getcwd() .. config.directory .. file_name .. config.file_ext)
	create_folder()
end

M.open = function()
	vim.ui.input({ prompt = "Open/create note: " }, function(file_name)
		if file_name == "" then
			create_file(config.default_file_name)
		elseif file_name == nil then
			print("No file created: provided valid value")
			return
		else
			create_file(file_name)
		end
	end)
end

return M
