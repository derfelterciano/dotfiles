return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		vim.filetype.add({
			extension = {
				tpp = "cpp",
				ipp = "cpp",
			},
		})
		configs.setup({
			ensure_installed = require("config.treesitter_languages"),
			sync_install = false,
			auto_instal = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
