local M = {}
local map = vim.keymap.set

M.on_attach = function(_, bufnr)
	local opts = { buffer = bufnr }

	map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	map("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
	map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
	map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	map({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
	map("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

M.capabilities = capabilities

-- taken from nvchad
M.on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local servers = require("config.servers")

			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				automatic_installation = true,
				automatic_enable = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "SmiteshP/nvim-navic" },
		},
		config = function()
			local servers = require("config.servers")
			local navic = require("nvim-navic")
			navic.setup({
				depth_limit = 20,
			})

			vim.lsp.config("*", { capabilities = M.capabilities, on_init = M.on_init })

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					M.on_attach(_, args.buf)
				end,
			})

			vim.lsp.inlay_hint.enable(true)
			for lsp, server_opts in pairs(servers) do
				local opts = vim.tbl_deep_extend("force", {
					-- on_attach = lsp_attach,
					on_attach = function(client, bufnr)
						navic.attach(client, bufnr)
						-- vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
					end,
				}, server_opts)

				vim.lsp.config(lsp, opts)
				vim.lsp.enable(lsp)
			end
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}
