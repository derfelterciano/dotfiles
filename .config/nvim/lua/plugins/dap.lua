return {
	"mfussenegger/nvim-dap",
	dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio", "folke/lazydev.nvim" },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup()

		require("lazydev").setup({
			library = { "nvim-dap-ui" },
		})

		vim.keymap.set("n", "<Leader>dt", function()
			dap.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>dc", function()
			dap.continue()
		end)

		-- attach to dap ui
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- c/c++/rust debugger
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}
	end,
}
