return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup({
			-- keep all the defaults…
			default = true,
			-- but override just the .tpp extension:
			override = {
				tpp = {
					-- use the same icon and color as 'cpp'
					icon = "", -- the C++ glyph
					color = "#519aba", -- the usual C++ blue
					name = "Tpp", -- a unique key
				},
			},
		})

		require("nvim-tree").setup({ -- BEGIN_DEFAULT_OPTS
			renderer = {
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
						modified = true,
						hidden = true,
						diagnostics = true,
						bookmarks = true,
					},
				},
			},
			diagnostics = {
				enable = false,
				show_on_dirs = false,
				show_on_open_dirs = true,
				debounce_delay = 500,
				severity = {
					min = vim.diagnostic.severity.HINT,
					max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			filters = {
				enable = false,
				git_ignored = true,
				dotfiles = false,
				git_clean = false,
				no_buffer = false,
				no_bookmark = false,
				custom = {},
				exclude = {},
			},
		}) -- END_DEFAULT_OPTS)
	end,
}
