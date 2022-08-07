local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

local packer_group = vim.api.nvim_create_augroup("packer", { clear = true })
vim.api.nvim_create_autocmd(
	"bufwritepost",
	{ command = "source <afile> | PackerCompile", group = packer_group, pattern = "init.lua" }
)

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("andweeb/presence.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("glepnir/dashboard-nvim")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp")
	use("jose-elias-alvarez/null-ls.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("l3mon4d3/luasnip")
	use("lewis6991/gitsigns.nvim")
	use("neovim/nvim-lspconfig")
	use("nvim-lua/plenary.nvim")
	use("nvim-lualine/lualine.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("onsails/lspkind-nvim")
	use("ryanoasis/vim-devicons")
	use("saadparwaiz1/cmp_luasnip")
	use("simrat39/rust-tools.nvim")
	use("tpope/vim-commentary")
	use("williamboman/nvim-lsp-installer")
	use("windwp/nvim-autopairs")
	use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
end)

vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.lazyredraw = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.updatetime = 100

vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<space>", "<nop>", { silent = true })
vim.keymap.set("n", "<leader>w", "<c-w>k")
vim.keymap.set("n", "<leader>a", "<c-w>h")
vim.keymap.set("n", "<leader>s", "<c-w>j")
vim.keymap.set("n", "<leader>d", "<c-w>l")
vim.keymap.set("n", "<leader>j", ":bprevious<cr>", { silent = true })
vim.keymap.set("n", "<leader>k", ":bnext<cr>", { silent = true })
vim.keymap.set("n", "<leader>q", ":bprevious<cr>:bdelete #<cr>", { silent = true })
vim.keymap.set("n", "<leader>/", ":nohlsearch<cr>", { silent = true })
vim.keymap.set("n", "<leader>y", ":%y<cr>")
vim.keymap.set("n", "k", "gk", { silent = true })
vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "<leader>l", ":vsplit term://bash <cr>", { silent = true })
vim.keymap.set("t", "<leader><esc>", "<c-\\><c-n>", { silent = true })
vim.keymap.set("n", "<leader>v", ":edit ~/.config/nvim/init.lua<cr>", { silent = true })

local lang_maps = {
	cpp = { build = "g++ % -o %:r", exec = "./%:r" },
	typescript = { build = "deno compile %", exec = "deno run %" },
	javascript = { build = "deno compile %", exec = "deno run %" },
	python = { exec = "python %" },
	java = { build = "javac %", exec = "java %:r" },
	sh = { exec = "./%" },
	go = { build = "go build", exec = "go run %" },
	rust = { exec = "cargo run" },
	arduino = {
		build = "arduino-cli compile --fqbn arduino:avr:uno %:r",
		exec = "arduino-cli upload -p /dev/ttyacm0 --fqbn arduino:avr:uno %:r",
	},
}
for lang, data in pairs(lang_maps) do
	if data.build ~= nil then
		vim.api.nvim_create_autocmd(
			"filetype",
			{ command = "nnoremap <leader>b :!" .. data.build .. "<cr>", pattern = lang }
		)
	end
	vim.api.nvim_create_autocmd(
		"filetype",
		{ command = "nnoremap <leader>e :split<cr>:terminal " .. data.exec .. "<cr>", pattern = lang }
	)
end
vim.api.nvim_create_autocmd("bufwritepre", {
	command = "lua vim.lsp.buf.formatting_sync(nil, 1000)",
	pattern = "*.cpp,*.css,*.go,*.h,*.html,*.js,*.json,*.jsx,*.lua,*.md,*.py,*.rs,*.ts,*.tsx,*.yaml",
})
vim.api.nvim_create_autocmd("insertenter", { command = "set norelativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("insertleave", { command = "set relativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("termopen", { command = "startinsert", pattern = "*" })
vim.api.nvim_create_autocmd("bufwinenter", { command = "set noexpandtab tabstop=2 shiftwidth=2", pattern = "*.rs" })

vim.cmd("sign define diagnosticsignerror text=● texthl=diagnosticsignerror")
vim.cmd("sign define diagnosticsignwarn text=● texthl=diagnosticsignwarn")
vim.cmd("sign define diagnosticsigninfo text=● texthl=diagnosticsigninfo")
vim.cmd("sign define diagnosticsignhint text=● texthl=diagnosticsignhint")

vim.diagnostic.config({ virtual_text = false })

require("presence"):setup({
	neovim_image_text = "neovim",
	presence_log_level = "error",
	presence_editing_text = "editing « %s »",
	presence_file_explorer_text = "browsing files",
	presence_reading_text = "reading  « %s »",
	presence_workspace_text = "working on « %s »",
})

vim.g.catppuccin_flavour = "mocha"
vim.cmd("colorscheme catppuccin")

local db = require("dashboard")
db.custom_header = {
	"zdarova",
}
db.custom_center = {
	{
		icon = " ",
		desc = "new file            ",
		action = "dashboardnewfile",
		shortcut = "spc o",
	},
	{
		icon = " ",
		desc = "browse files        ",
		action = "telescope file_browser",
		shortcut = "spc n",
	},
	{
		icon = " ",
		desc = "find file           ",
		action = "telescope find_files",
		shortcut = "spc f",
	},
	{
		icon = " ",
		desc = "configure neovim    ",
		action = "edit ~/.config/nvim/lua/init.lua",
		shortcut = "spc v",
	},
	{
		icon = " ",
		desc = "exit neovim              ",
		action = "quit",
	},
}
vim.keymap.set("n", "<leader>o", ":dashboardnewfile<cr>", { silent = true })

local luasnip = require("luasnip")
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<c-space>"] = cmp.mapping.complete(),
		["<cr>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.replace, select = true }),
		["<tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<s-tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = { { name = "nvim_lsp" }, { name = "luasnip" } },
})

local servers = {
	"bashls",
	"clangd",
	"cssls",
	"gopls",
	"html",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"tailwindcss",
	"tsserver",
}
local has_formatter = { "gopls", "html", "rust_analyzer", "sumneko_lua", "tsserver" }
for _, name in pairs(servers) do
	local found, server = require("nvim-lsp-installer").get_server(name)
	if found and not server:is_installed() then
		print("yep")
		print("installing " .. name)
		print("yyeeeapp")
		server:install()
	end
end
local setup_server = {
	sumneko_lua = function(opts)
		opts.settings = { lua = { diagnostics = { globals = { "vim" } } } }
	end,
}
require("nvim-lsp-installer").on_server_ready(function(server)
	local opts = {
		on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			local opts = { buffer = bufnr }
			vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>i", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
			local should_format = true
			for _, value in pairs(has_formatter) do
				if client.name == value then
					should_format = false
				end
			end
			if not should_format then
				client.resolved_capabilities.document_formatting = false
			end
		end,
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}
	if setup_server[server.name] then
		setup_server[server.name](opts)
	end
	server:setup(opts)
end)

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.stylua,
	},
})

require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

local cp = require("catppuccin.palettes.init").get_palette()
local custom_catppuccin = require("lualine.themes.catppuccin")
custom_catppuccin.normal.b.bg = cp.surface0
custom_catppuccin.normal.c.bg = cp.base
custom_catppuccin.insert.b.bg = cp.surface0
custom_catppuccin.command.b.bg = cp.surface0
custom_catppuccin.visual.b.bg = cp.surface0
custom_catppuccin.replace.b.bg = cp.surface0
custom_catppuccin.inactive.a.bg = cp.base
custom_catppuccin.inactive.b.bg = cp.base
custom_catppuccin.inactive.b.fg = cp.surface0
custom_catppuccin.inactive.c.bg = cp.base
require("lualine").setup({
	options = {
		theme = custom_catppuccin,
		component_separators = "|",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
		lualine_b = { "filename", "branch", { "diff", colored = false } },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
				separator = { left = "", right = "" },
				right_padding = 2,
				symbols = { alternate_file = "" },
			},
		},
	},
})

local telescope = require("telescope")
telescope.setup({
	defaults = {
		mappings = { n = { ["o"] = require("telescope.actions").select_default } },
		initial_mode = "normal",
		hidden = true,
		file_ignore_patterns = { ".git/", "node_modules/", "target/" },
	},
	extensions = { file_browser = { hidden = true } },
})
telescope.load_extension("file_browser")
vim.keymap.set("n", "<leader>n", telescope.extensions.file_browser.file_browser)
vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>t", require("telescope.builtin").treesitter)

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"cpp",
		"css",
		"go",
		"html",
		"lua",
		"make",
		"python",
		"rust",
		"tsx",
		"typescript",
		"yaml",
	},
	highlight = { enable = true },
})

require("rust-tools").setup({})

vim.keymap.set({ "n", "v" }, "<leader>c", ":commentary<cr>", { silent = true })

require("nvim-autopairs").setup({})

require("lsp_lines").setup({})
vim.keymap.set("n", "<leader>x", require("lsp_lines").toggle)
