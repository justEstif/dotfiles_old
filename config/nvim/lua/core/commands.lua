-- custom commands
vim.api.nvim_create_user_command(
	"Timestamp",
	[[:put =strftime('%Y%m%d%H%M%S') | :norm kJ]],
	{ desc = "Timestamp and paste in line below" }
)
vim.api.nvim_create_user_command(
	"RandomString",
	[[!openssl rand -hex 32 | xsel -ib]],
	{ desc = "Generate random string and store into registry" }
)
vim.api.nvim_create_user_command("ClearRegister", function()
	local regs = vim.fn.split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"*', "\\zs")
	for _, r in ipairs(regs) do
		vim.fn.setreg(r, {})
	end
end, { desc = "Clear all registers" })
