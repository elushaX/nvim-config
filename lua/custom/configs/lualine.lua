return {
	require("lualine").setup({
		options = {
			icons_enabled = true,
			-- theme = "ashes",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {},
		inactive_sections = {},
		tabline = {
			-- lualine_a = { "buffers" },
			-- lualine_a = { "location" },
			lualine_x = { "branch", "diff", "diagnostics" },
			lualine_z = { "mode" },
			lualine_c = { "filename" },
			-- lualine_x = { "encoding", "fileformat", "filetype" },
			-- lualine_y = { "progress" },
		},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	}),
}
