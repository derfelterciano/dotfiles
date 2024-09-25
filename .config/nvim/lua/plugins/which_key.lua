return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		preset = "modern",
		keys = {
			scroll_down = "<c-Down>", -- binding to scroll down inside the popup
			scroll_up = "<c-Up>", -- binding to scroll up inside the popup
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},

	config = function()
		require("which-key").setup({})
	end,
}
