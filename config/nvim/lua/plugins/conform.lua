return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			fish = { "fish_indent" },
			go = { "gofumpt" },
			html = { "prettierd" },
			javascript = { { "deno_fmt", "prettierd" } },
			javascriptreact = { { "deno_fmt", "prettierd" } },
			json = { { "deno_fmt", "prettierd" } },
			markdown = { { "deno_fmt", "prettierd" } },
			lua = { "stylua" },
			typescript = { { "deno_fmt", "prettierd" } },
			typescriptreact = { { "deno_fmt", "prettierd" } },
			svelte = { "prettierd", "eslint" },
		},
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},
	},
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format()
			end,
			desc = "Format",
		},
	},
	config = true,
}
