-----------------------------------------------------------
-- Netrw configuration file
----------------------------------------------------------

local g = vim.g

local options_append = {
	netrw_keepdir = 0, --Keep the current directory and the browsing directory synced
	netrw_winsize = "17", -- 30% size
	netrw_banner = "0", -- hide banner
	netrw_localcopydircmd = "cp -r", -- change copy command
	netrw_localrmdir = "rm -r", -- change delete command
	netrw_list_hide = [['\(^\|\s\s\)\zs\.\S\+']],
}

for k, v in pairs(options_append) do
	g[k] = v
end

vim.api.nvim_create_autocmd("filetype", {
	pattern = "netrw",
	desc = "Better mappings for netrw",
	callback = function()
		local bind = function(lhs, rhs)
			vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
		end

    -- NOTE use terminal for other things
		bind("H", "u") -- preview dir
		bind("h", "-^") -- go up
		bind("l", "<CR>") -- open file or dir
		bind(".", "gh") -- toggle dotfiles
		bind("<leader>dd", ":Lexplore<CR>") -- close if open
	end,
})
