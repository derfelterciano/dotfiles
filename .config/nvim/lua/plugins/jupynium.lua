return {
	{
		"kiyoon/jupynium.nvim",
		build = "pip3 install --user .",
		-- build = "conda run --no-capture-output -n jupynium pip install .",
		-- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
		config = function()
			require("jupynium").setup({
				auto_start_server = {
					enable = true,
					file_pattern = { "*.ju.*" },
				},
				use_default_keybindings = true,
			})
		end,
	},
	"rcarriga/nvim-notify", -- optional
	"stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
}
