-- https://github.com/Ostralyan/scribe.nvim
local M = {}

local config = {
	directory = vim.fn.getcwd() .. "/notes/",
	file_ext = ".md",
	default_file_name = "index",
}

local create_folder = function()
	local dir_exists = vim.fn.isdirectory(config.directory) ~= 0

	if dir_exists == false then
		os.execute("mkdir -p " .. config.directory)
	end
end

local create_file = function(file_name)
	create_folder()
	vim.cmd("e " .. config.directory .. file_name .. config.file_ext)
end

M.open = function()
	vim.ui.input({ prompt = "Open/create note: " }, function(file_name)
		if file_name == "" then
			create_file(config.default_file_name)
		elseif file_name == nil then
			print("nil value provided; no file created")
			return
		else
			create_file(file_name)
		end
	end)
end

return M
