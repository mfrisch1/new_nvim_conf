return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim",
				opts = {},
				build = ":MasonUpdate",
				config = true
			},
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = {
			ensure_installed = {
				"clangd",
				"lua_ls",
				"gopls",
				"bashls",
				"biome",
				"yamlls",
				"ts_ls",
				"tailwindcss-language-server",
				"css-variables-language-server",
			},
			automatic_installation = true,
			automatic_enable = true,
		},
		config = function(_, opts)
			require("mason").setup()
			require("mason-lspconfig").setup({opts})
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						}
					}
				}
			})
		end,
	}
}
