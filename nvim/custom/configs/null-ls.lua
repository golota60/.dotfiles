local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
	formatting.prettier,
	formatting.stylua,

	lint.shellcheck,
}

null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = function()
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end,
})
