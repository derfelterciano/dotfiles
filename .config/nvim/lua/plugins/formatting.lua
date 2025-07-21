local formatters = require("config.formatters")

return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		require("mason-null-ls").setup({
			ensure_installed = formatters,
			automatic_installation = true,
		})

		vim.g.rustfmt_autosave = 1

		local null_ls = require("null-ls")
		local on_attach = function(client, bufnr)
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ async = false })
					end,
				})

				--manual key bind
				local opts = { buffer = bufnr }
				vim.keymap.set("n", "<leader>af", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end
		end

		null_ls.setup({
			sources = {
				--lua
				null_ls.builtins.formatting.stylua,

				-- python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				-- null_ls.builtins.diagnostics.flake8,
				require("none-ls.diagnostics.flake8"),

				--js, ts
				null_ls.builtins.formatting.prettier,
				-- null_ls.builtins.diagnostics.eslint_d,

				-- c/c++
				null_ls.builtins.formatting.clang_format,

				-- cmake
				-- require("none-ls.diagnostics.cmake_lint"),
			},
			on_attach = on_attach,
		})
	end,
}
