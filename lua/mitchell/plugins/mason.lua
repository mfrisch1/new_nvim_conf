return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"lua_ls",
				"gopls",
				"bashls",
				"jsonls",
				"yamlls"
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_enable = true,
			})
			local lsp = vim.lsp
			lsp.enable("gopls")
			lsp.enable("clangd")

			lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			lsp.enable("lua_ls")

		end
	}
}
