local M = {}

-- fetch keymap
-- local map = vim.api.nvim_set_keymap

-- map the key n to run the command :NvimTreeToggle
-- map('n', 'n', [[:NvimTreeToggle<CR>]], {})

-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>f', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>q', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

function BuffSwitch()
	local settings = {
		layout_strategy = "center",
		sort_lastused = true,
		ignore_current_buffer = true,
		layout_config = { width = 0.3, height = 0.8, prompt_position = "bottom" },
		startinsert = false,
	}
	require("telescope.builtin").buffers(settings)
end

function BuffersDelete()
	vim.cmd([[
  %bd
  cd ~/main/src/
  ]])
end

local nvtree_show_buff_only = false
function NVTreeToggleBufferView()
	if nvtree_show_buff_only then
    print("Hello")
	  nvtree_show_buff_only = false
  else
    print("Bye")
    nvtree_show_buff_only = true
	end
end

M.general = {
	n = {
		[";"] = { ":", "command mode", opts = { nowait = true } },
		["<Leader><Leader>"] = { ":nohlsearch<CR>" }, -- clear searrch highlighting
		["C-f"] = { ":Format<CR>" },
		["<Leader>cc"] = { ":ClangdSwitchSourceHeader<CR>" },
		["t"] = { ":lua BuffSwitch()<CR>" },
		["<Leader>tt"] = { "<cmd> Telescope<CR>" },
		["<Leader>ll"] = { "<cmd>lua require('persistence').load({ last = true })<cr>", "load last session" },
		["<Leader>ld"] = { "<cmd>lua BuffersDelete()<cr>", "clear current session" },
		["<Leader>sa"] = { "<cmd> wa<cr>", "save all files" },
		["<Leader>ss"] = { "<cmd> w<cr>", "save file" },
		["<Leader>sq"] = { "<cmd> wqa<cr>", "save all files and quit" },
		["<Leader>sd"] = { "<cmd> bd<cr>", "close current buffer" },
		["<Leader>ee"] = { "<cmd> lua NVTreeToggleBufferView()<cr>", "show open tabs in nvtree" },
	},
}

---[[
M.telescope = {
	n = {
		["<Leader>tg"] = { ":Telescope git_files <CR>", "find files tracked by git" },
		-- ["<leader>tf"] = { "<cmd> Telescope find_files <CR>", "find files" },
		["<leader>tf"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
		["<leader>ta"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
		-- ["C-t"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
		-- ["<leader>ph"] = { "<cmd> Telescope help_tags <CR>", "help page" },
		-- ["<leader>po"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
		["<leader>tH"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
	},
}
--]]

M.nvim_dap = {
	n = {
		["<leader>dl"] = { "<cmd>lua require'dap'.step_into()<CR>", "debugger step into" },
		["<leader>dj"] = { "<cmd>lua require'dap'.step_over()<CR>", "debugger step over" },
		["<leader>dk"] = { "<cmd>lua require'dap'.step_out()<CR>", "debugger step out" },
		["<leader>d<space>"] = { "<cmd>lua require'dap'.continue()<CR>", "debugger continue" },
		["<leader>dbp"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "debugger toggle breakpoint" },
		["<leader>dd"] = {
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
			"debugger set conditional breakpoint",
		},
		["<leader>de"] = { "<cmd>lua require'dap'.terminate()<CR>", "debugger reset" },
		["<leader>dr"] = { "<cmd>lua require'dap'.run_last()<CR>", "debugger reset" },
		-- map("n", "<leader>m", ":MaximizerToggle!<CR>", { noremap = true })
	},
}

M.nvterm = {
	plugin = true,

	t = {
		-- toggle in terminal mode
		["<C-\\>"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"toggle floating term",
		},

		["<leader-h>"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"toggle horizontal term",
		},

		["<leader-v>"] = {
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			"toggle vertical term",
		},
	},

	n = {
		-- toggle in normal mode
		["<C-\\>"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"toggle floating term",
		},

		["<leader-h>"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"toggle horizontal term",
		},

		["<leader-v>"] = {
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			"toggle vertical term",
		},

		-- new

		-- ["<leader>h"] = {
		--   function()
		--     require("nvterm.terminal").new "horizontal"
		--   end,
		--   "new horizontal term",
		-- },
		--
		-- ["<leader>v"] = {
		--   function()
		--     require("nvterm.terminal").new "vertical"
		--   end,
		--   "new vertical term",
		-- },
	},
}

M.nvimtree = {
	n = {
		["<C-a>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
	},
}

M.lspconfig = {
	n = {
		["gl"] = { '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>' },
		["<leader>dF"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "go to previous diagnostic" },
		["<leader>df"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "go to next diagnostic" },
		["<leader>dt"] = { "<cmd>Telescope diagnostics<CR>", "telescope diagnostics" },
		["<leader>da"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "lsp code action" },
	},
}

M.null_ls = {
	n = {
		["<C-f>"] = {
			'<cmd>lua require("custom.configs.lsp.null-ls").lsp_formatting(vim.api.nvim_get_current_buf()) <CR>',
			"Format current file using null-ls",
		},
	},
}

M.nvim_bufdel = {
	n = {
		["<leader>q"] = { "<cmd>BufDel<CR>", "close buffer" },
		["<leader>Q"] = { "<cmd>BufDel!<CR>", "close buffer ignore changes" },
	},
}

M.tabufline = {
	n = {
		["<TAB>"] = { "<C-i>" },
		["L"] = {
			function()
				require("nvchad.tabufline").tabuflineNext()
			end,
			"goto next buffer",
		},

		["H"] = {
			function()
				require("nvchad.tabufline").tabuflinePrev()
			end,
			"goto prev buffer",
		},
	},
}

M.plenary = {
	n = {
		["<leader>t"] = { "<Plug>PlenaryTestFile", "run plenary test on file" },
	},
}

M.copilot = {
	i = {
		["<C-l>"] = {
			function()
				vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
			end,
			"Copilot Accept",
			{ replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
		},
	},
}

return M
