return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"javascript",
				"html",
				"rust",
				"python",
			},
			sync_install = false,
			auto_instal = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
