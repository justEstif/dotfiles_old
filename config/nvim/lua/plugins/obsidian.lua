local status, obsidian = pcall(require, "obsidian")
if not status then
	print("obsidian error")
	return
end

obsidian.setup({
	dir = "~/Sync/notes/",
	daily_notes = { folder = "daily" },
	note_id_func = function(title)
		if title then
			return tostring(os.date("%Y%m%d%H%M%S")) .. "-" .. title
		else
			return tostring(os.date("%Y%m%d%H%M%S"))
		end
	end,
})
