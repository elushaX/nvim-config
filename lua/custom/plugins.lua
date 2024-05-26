local overrides = require("custom.configs.overrides")

return {

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"nvim-telescope/telescope.nvim",
		opts = {
			defaults = {
				mappings = {
					i = {
						["<esc>"] = function(...)
							require("telescope.actions").close(...)
						end,
					},
				},
			},
		},
	},

	-- add telescope-fzf-native
	{
		"telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			lazy = false,
			config = function()
				require("telescope").load_extension("fzf")
				require("custom.configs.telescope")
			end,
		},
    enabled = true,
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = overrides.gitsigns,
	},
	
	-- autocompletion
	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
	},

	-- Additional plugins

	-- escape using key combo (currently set to jk)
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("custom.configs.betterescape")
		end,
	},

	{
		"mfussenegger/nvim-dap",
		config = function()
			require("custom.configs.dap")
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup()
		end,
		requires = { "mfussenegger/nvim-dap" },
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
		requires = { "mfussenegger/nvim-dap" },
	},

	-- better bdelete, close buffers without closing windows
	{
		"ojroques/nvim-bufdel",
		lazy = false,
	},

	{
		"nvim-lua/plenary.nvim",
	},

	{
		"vimwiki/vimwiki",
	},

	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		enabled = false,
		config = function()
			require("custom.configs.lualine")
		end,
	},

	-- to disable tabs
	{
		"romgrk/barbar.nvim",
		lazy = false,
    enabled = false,
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		config = function()
			require("custom.configs.barbar")
		end,
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
}
