local status, obsidian = pcall(require, "obsidian")
if not status then
	return
end

obsidian.setup({
	dir = "~/Sync/notes/",
	notes_subdir = "vim_notes",
	completion = { nvim_cmp = true },
	daily_notes = { folder = "daily" },
	note_id_func = function(title)
		-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
		local suffix = ""
		if title ~= nil then
			suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		else
			for _ = 1, 4 do
				suffix = suffix .. string.char(math.random(65, 90))
			end
		end
		return tostring(os.time()) .. "-" .. suffix
	end,
})
