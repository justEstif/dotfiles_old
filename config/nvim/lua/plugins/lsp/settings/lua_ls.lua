return {
	handlers = {
		["textDocument/definition"] = function(_, result, ctx, _)
			if result == nil or vim.tbl_isempty(result) then
				return nil
			end
			local client = vim.lsp.get_client_by_id(ctx.client_id)

			local res = vim.tbl_islist(result) and result[1] or result
			vim.lsp.util.jump_to_location(res, client.offset_encoding)
		end,
	},
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},

			diagnostics = {
				-- Get the language server to recognize common globals
				globals = { "vim", "describe", "it", "before_each", "after_each" },
				disable = { "need-check-nil" },
			},
			workspace = { ignoreSubmodules = true },
			telemetry = { enable = false },
		},
	},
}
