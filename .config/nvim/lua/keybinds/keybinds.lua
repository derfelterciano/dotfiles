vim.g.mapleader = " "

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- neo-tree
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>f", "<Cmd>Neotree focus<CR>")

-- BUFFERLINE (used to be barbar)
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferLineCyclePrev<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferLineCycleNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferLineMovePrev<CR>", opts)
map("n", "<A->>", "<Cmd>BufferLineMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>lua require('bufferline').go_to(1, true)<CR>", opts)
map("n", "<A-2>", "<Cmd>lua require('bufferline').go_to(2, true)<CR>", opts)
map("n", "<A-3>", "<Cmd>lua require('bufferline').go_to(3, true)<CR>", opts)
map("n", "<A-4>", "<Cmd>lua require('bufferline').go_to(4, true)<CR>", opts)
map("n", "<A-5>", "<Cmd>lua require('bufferline').go_to(5, true)<CR>", opts)
map("n", "<A-6>", "<Cmd>lua require('bufferline').go_to(6, true)<CR>", opts)
map("n", "<A-7>", "<Cmd>lua require('bufferline').go_to(7, true)<CR>", opts)
map("n", "<A-8>", "<Cmd>lua require('bufferline').go_to(8, true)<CR>", opts)
map("n", "<A-9>", "<Cmd>lua require('bufferline').go_to(9, true)<CR>", opts)
map("n", "<A-$>", "<Cmd>lua require('bufferline').go_to(-1, true)<CR>", opts)

-- map("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
-- map("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
-- map("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
-- map("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
-- map("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
-- map("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
-- map("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
-- map("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
-- map("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
-- map("n", "<A-0>", "<Cmd>BufferLineGoToBuffer -1<CR>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Goto pinned/unpinned buffer
--                 :BufferLineGoToBufferPinned
--                 :BufferLineGoToBufferUnpinned
-- Close buffer
-- map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
map("n", "<A-c>", "<Cmd>NvimTreeClose<CR><Cmd>bdelete<CR>", opts)
-- map("n", "<A-c>", "<Cmd>bdelete<CR>", opts)

-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- Nvim-tree
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", opts)
map("n", "<leader>f", "<Cmd>NvimTreeFocus<CR>", opts)

-- toggle term
vim.keymap.set("n", "<leader>tt", "<Cmd>ToggleTerm<CR>", { noremap = true, silent = true, desc = "Toggle terminal" })
vim.keymap.set(
	"n",
	"<leader>tf",
	"<Cmd>ToggleTerm direction=float<CR>",
	{ noremap = true, silent = true, desc = "Floating terminal" }
)
vim.keymap.set(
	"n",
	"<leader>th",
	"<Cmd>ToggleTerm direction=horizontal<CR>",
	{ noremap = true, silent = true, desc = "Horizontal terminal" }
)
vim.keymap.set(
	"n",
	"<leader>tv",
	"<Cmd>ToggleTerm direction=vertical<CR>",
	{ noremap = true, silent = true, desc = "Vertical terminal" }
)

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })

-- Symbols Outline
vim.keymap.set(
	"n",
	"<leader>so",
	"<Cmd>SymbolsOutline<CR>",
	{ noremap = true, silent = true, desc = "Toggle Symbols-Outline" }
)
