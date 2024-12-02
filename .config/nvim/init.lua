require("config.lazy")
require("keybinds.keybinds")

-- theme
-- vim.cmd.colorscheme("onedark")
-- vim.cmd.colorscheme("tokyonight")
-- vim.cmd.colorscheme("rose-pine")
vim.cmd.colorscheme("kanagawa")

-- buffer settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.diagnostic.config({
	update_in_insert = true,
})
vim.wo.relativenumber = true

-- clipboard
vim.opt.clipboard:append("unnamedplus")
