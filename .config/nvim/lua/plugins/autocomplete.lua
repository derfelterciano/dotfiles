return {
	"saghen/blink.cmp",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			dependencies = { "rafamadriz/friendly-snippets" },
			config = function()
				require("luasnip").filetype_extend("javascriptreact", { "html", "css", "jsx" })
				require("luasnip").filetype_extend("typescriptreact", { "html", "css", "tsx" })
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		{ "nvim-tree/nvim-web-devicons" },
		{ "onsails/lspkind.nvim" },
	},

	version = "1.*",
	opts = {
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback_to_mappings" },
			["<C-n>"] = { "select_next", "fallback_to_mappings" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		snippets = { preset = "luasnip" },

		signature = {
			enabled = true,
			trigger = { enabled = true, show_on_insert = true },
			window = { border = "single" },
		},
		completion = {
			menu = {
				border = "single",
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								local icon = ctx.kind_icon
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										icon = dev_icon
									end
								else
									icon = require("lspkind").symbolic(ctx.kind, {
										mode = "symbol",
									})
								end

								return icon .. ctx.icon_gap
							end,

							-- Optionally, use the highlight groups from nvim-web-devicons
							-- You can also add the same function for `kind.highlight` if you want to
							-- keep the highlight groups in sync with the icons.
							highlight = function(ctx)
								local hl = ctx.kind_hl
								if vim.tbl_contains({ "Path" }, ctx.source_name) then
									local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
									if dev_icon then
										hl = dev_hl
									end
								end
								return hl
							end,
						},
					},
				},
			},
			list = { selection = { preselect = false } },
			ghost_text = { enabled = true },
			documentation = { auto_show = true, auto_show_delay_ms = 100, window = { border = "single" } },
		},

		sources = {
			default = { "lsp", "path", "buffer", "snippets" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}

-- === DEPRECATED CONFIG ===
-- return {
-- "VonHeikemen/lsp-zero.nvim",
-- branch = "v4.x",
-- dependencies = {
-- 	{ "neovim/nvim-lspconfig" },
-- 	{ "hrsh7th/cmp-nvim-lsp" },
-- 	{ "hrsh7th/nvim-cmp" },
-- 	{ "hrsh7th/cmp-buffer" },
-- 	{ "hrsh7th/cmp-path" },
-- 	{ "saadparwaiz1/cmp_luasnip" },
-- 	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
-- 	{ "SmiteshP/nvim-navic" },
--
-- 	-- snippets
-- 	{
-- 		"L3MON4D3/LuaSnip",
-- 		-- follow latest release.
-- 		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
-- 		dependencies = { "rafamadriz/friendly-snippets" },
-- 		config = function()
-- 			require("luasnip").filetype_extend("javascriptreact", { "html", "css", "jsx" })
-- 			require("luasnip").filetype_extend("typescriptreact", { "html", "css", "tsx" })
-- 			require("luasnip.loaders.from_vscode").lazy_load()
-- 		end,
-- 	},
-- },
--
-- config = function()
-- 	local lsp_zero = require("lsp-zero")
-- 	local navic = require("nvim-navic")
-- 	navic.setup({
-- 		depth_limit = 20,
-- 	})
--
-- 	-- lsp_attach is where you enable features that only work
-- 	-- if there is a language server active in the file
-- 	local lsp_attach = function(client, bufnr)
-- 		local opts = { buffer = bufnr }
--
-- 		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
-- 		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
-- 		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
-- 		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
-- 		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
-- 		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
-- 		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
-- 		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
-- 		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
-- 		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
--
-- 		-- inlay hints (like for rust)
-- 		-- vim.lsp.inlay_hint.enable(true, opts)
-- 	end
--
-- 	lsp_zero.extend_lspconfig({
-- 		sign_text = true,
-- 		lsp_attach = lsp_attach,
-- 		capabilities = require("cmp_nvim_lsp").default_capabilities(),
-- 	})
--
-- 	local servers = require("config.servers")
-- 	local lspconfig = require("lspconfig")
-- 	local util = lspconfig.util
-- 	for lsp, server_opts in pairs(servers) do
-- 		local opts = vim.tbl_deep_extend("force", {
-- 			-- on_attach = lsp_attach,
-- 			on_attach = function(client, bufnr)
-- 				navic.attach(client, bufnr)
-- 				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
-- 			end,
-- 		}, server_opts)
--
-- 		lspconfig[lsp].setup(opts)
-- 	end
--
-- 	local cmp = require("cmp")
-- 	local cmp_format = require("lsp-zero").cmp_format({ details = true })
-- 	local cmp_action = require("lsp-zero").cmp_action()
--
-- 	cmp.setup({
-- 		experimental = {
-- 			ghost_text = true,
-- 		},
-- 		sources = {
-- 			{ name = "nvim_lsp" },
-- 			{ name = "buffer" },
-- 			{ name = "path" },
-- 			{ name = "luasnip" },
-- 			{ name = "nvim_lsp_signature_help" },
-- 		},
-- 		snippet = {
-- 			expand = function(args)
-- 				require("luasnip").lsp_expand(args.body)
-- 			end,
-- 		},
--
-- 		formatting = cmp_format,
--
-- 		mapping = cmp.mapping.preset.insert({
-- 			["<Tab>"] = cmp_action.tab_complete(),
-- 			["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
-- 			["<CR>"] = cmp.mapping.confirm({ select = false }),
-- 		}),
--
-- 		window = {
-- 			completion = cmp.config.window.bordered(),
-- 			documentation = cmp.config.window.bordered(),
-- 		},
-- 	})
-- end,
-- }
