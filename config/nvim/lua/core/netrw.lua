-----------------------------------------------------------
-- Netrw configuration file
----------------------------------------------------------

local g = vim.g
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

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

autocmd("filetype", {
	pattern = "netrw",
	desc = "Better mappings for netrw",
	callback = function()
		local bind = function(lhs, rhs)
			vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
		end

		bind("H", "u") -- preview dir
		bind("h", "-^") -- go up
		bind("l", "<CR>") -- open file or dir
		bind(".", "gh") -- toggle dotfiles
		bind("<leader>dd", ":Lexplore<CR>") -- close if open

		-- Marks
		bind("<Tab>", "mf") -- add mark
		bind("<S-Tab>", "mf") -- remove mark
		bind("<leader><tab>", "mu") -- remove all marks

		-- Files
		bind("ff", ":!touch ") -- create file
		bind("fF", ":!mkdir -p ") -- create folder
		bind("fe", "R") -- Rename
		bind("fc", "mc") -- copy
		bind("fC", "mtmc")
		bind("fx", "mm") -- move marked files
		bind("fX", "mtmm")
		bind("f;", "mx") -- run command

		bind("fl", ' :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>') -- show list of marked files
		bind("fq", [[:echo 'Target:' . netrw#Expose("netrwmftgt")<CR>]]) -- show the target directory,
		bind("fd", "mtfq")

		bind("bb", "mb") -- To create a bookmark.
		bind("bd", "mB") -- To remove the most recent bookmark.
		bind("bl", "gb") -- To jump to the most recent bookmark.
	end,
})
