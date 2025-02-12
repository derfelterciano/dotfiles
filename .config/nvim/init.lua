require("config.lazy")
require("keybinds.keybinds")

-- theme
-- vim.cmd.colorscheme("onedark")
-- vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("kanagawa")
-- vim.cmd.colorscheme("gruvbox-material")
-- vim.cmd.colorscheme("ayu-mirage")
vim.cmd.colorscheme("monokai-pro")

-- buffer settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.diagnostic.config({
	update_in_insert = true,
})
vim.wo.relativenumber = true
vim.opt.colorcolumn = "80,100"

-- clipboard
vim.opt.clipboard:append("unnamedplus")
