return {
	lua_ls = {},
	rust_analyzer = {},
	clangd = {
		cmd = {
			"clangd",
			"--background-index", -- index your codebase for smarter results
			"--clang-tidy", -- run clang-tidy for linting
			"--completion-style=detailed", -- show return types, overloads, etc.
			"--header-insertion=iwyu", -- insert headers automatically if missing
			"--cross-file-rename=true", -- smarter rename across files
			"--suggest-missing-includes", -- attempt to auto-suggest missing includes
		},
		filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp", "ipp", "tpp" },
	},
	html = {},
	marksman = {},
	bashls = {},
	jsonls = {},
	pyright = {},
	denols = {},
	svelte = {},
}
