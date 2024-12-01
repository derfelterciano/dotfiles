return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = require("config.db_header"),
				center = {
					{
						icon = "󰈞  ",
						desc = "Find  File                              ",
						action = "Leaderf file --popup",
						key = "<Leader> f f",
					},
					{
						icon = "󰈢  ",
						desc = "Recently opened files                   ",
						action = "Leaderf mru --popup",
						key = "<Leader> f r",
					},
					{
						icon = "󰈬  ",
						desc = "Project grep                            ",
						action = "Leaderf rg --popup",
						key = "<Leader> f g",
					},
					{
						icon = "  ",
						desc = "New file                                ",
						action = "enew",
						key = "e",
					},
					{
						icon = "󰗼  ",
						desc = "Quit Nvim                               ",
						-- desc = "Quit Nvim                               ",
						action = "qa",
						key = "q",
					},
				},
			},
			shortcut = {
				{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
				{
					icon = " ",
					icon_hl = "@variable",
					desc = "Files",
					group = "Label",
					action = "Telescope find_files",
					key = "f",
				},
				{
					desc = " Apps",
					group = "DiagnosticHint",
					action = "Telescope app",
					key = "a",
				},
				{
					desc = " dotfiles",
					group = "Number",
					action = "Telescope dotfiles",
					key = "d",
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
