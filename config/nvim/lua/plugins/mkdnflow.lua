local status, mkdnflow = pcall(require, "mkdnflow")
if not status then
	print("mkdnflow error")
	return
end

mkdnflow.setup({
	to_do = {
		symbols = { " ", "-", "x" },
		update_parents = true,
		not_started = " ",
		in_progress = "-",
		complete = "x",
	},
	mappings = {
		MkdnEnter = { { "n", "v" }, "<CR>" },
		MkdnTab = false,
		MkdnSTab = false,
		MkdnNextLink = { "n", "<Tab>" },
		MkdnPrevLink = { "n", "<S-Tab>" },
		MkdnNextHeading = { "n", "]]" },
		MkdnPrevHeading = { "n", "[[" },
		MkdnGoBack = { "n", "<BS>" },
		MkdnGoForward = { "n", "<Del>" },
		MkdnCreateLink = false, -- see MkdnEnter
		MkdnCreateLinkFromClipboard = { { "n", "v" }, "<leader>p" }, -- see MkdnEnter
		MkdnFollowLink = false, -- see MkdnEnter
		MkdnDestroyLink = { "n", "<M-CR>" },
		MkdnTagSpan = { "v", "<M-CR>" },
		MkdnMoveSource = { "n", "<F2>" },
		MkdnYankAnchorLink = { "n", "ya" },
		MkdnYankFileAnchorLink = { "n", "yfa" },
		MkdnIncreaseHeading = { "n", "+" },
		MkdnDecreaseHeading = { "n", "-" },
		MkdnToggleToDo = { { "n", "v" }, "<C-Space>" },
		MkdnNewListItem = false,
		MkdnNewListItemBelowInsert = { "i", "<S-Cr>" },
		MkdnNewListItemAboveInsert = false,
		MkdnExtendList = false,
		MkdnUpdateNumbering = { "n", "<leader>nn" },
		MkdnTableNextCell = { "i", "<Tab>" },
		MkdnTablePrevCell = { "i", "<S-Tab>" },
		MkdnTableNextRow = false,
		MkdnTablePrevRow = { "i", "<M-CR>" },
		MkdnTableNewRowBelow = { "n", "<leader>ir" },
		MkdnTableNewRowAbove = { "n", "<leader>iR" },
		MkdnTableNewColAfter = { "n", "<leader>ic" },
		MkdnTableNewColBefore = { "n", "<leader>iC" },
		MkdnFoldSection = false,
		MkdnUnfoldSection = false,
	},
})
