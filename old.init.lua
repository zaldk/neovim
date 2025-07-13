vim.g.have_nerd_font            = true
vim.g.mapleader                 = ' '
vim.g.maplocalleader            = ' '
vim.g.markdown_fenced_languages = { "ts=typescript" }
vim.opt.autoindent              = true
vim.opt.breakindent             = true
vim.opt.clipboard               = 'unnamedplus'
vim.opt.colorcolumn             = '80'
vim.opt.cursorline              = false
vim.opt.expandtab               = true
vim.opt.fillchars               = [[eob: ,fold: ,foldopen:v,foldsep: ,foldclose:>]]
vim.opt.foldcolumn              = '0'
vim.opt.foldlevel               = 99
vim.opt.foldlevelstart          = 99
-- vim.opt.foldmarker              = '<<<,>>>'
vim.opt.foldmethod              = 'marker'
vim.opt.hlsearch                = false
vim.opt.ignorecase              = true
vim.opt.inccommand              = 'split'
vim.opt.incsearch               = true
vim.opt.linebreak               = true
vim.opt.list                    = true
vim.opt.listchars               = { tab = '» ', trail = '·', nbsp = '␣', leadmultispace = '    ' }
vim.opt.mouse                   = 'a'
vim.opt.mousescroll             = 'ver:1,hor:1'
vim.opt.number                  = true
vim.opt.scrolloff               = 0
vim.opt.shiftwidth              = 4
vim.opt.showmatch               = false
vim.opt.signcolumn              = 'no'
vim.opt.smartcase               = true
vim.opt.smartindent             = true
vim.opt.splitbelow              = true
vim.opt.splitright              = true
vim.opt.swapfile                = false
-- vim.opt.tabstop                 = 4
vim.opt.undofile                = true
vim.opt.updatetime              = 250
vim.opt.makeprg                 = "./build"

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set("n", "<leader>w", "<CMD>w<CR>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set({ "x", "v" }, "p", "P")
vim.keymap.set({ "n", "x" }, "x", "\"_x")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("n", "n", "nzvzz")
vim.keymap.set("n", "N", "Nzvzz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<A-j>", "<CMD>cnext<CR>zvzz")
vim.keymap.set("n", "<A-k>", "<CMD>cprev<CR>zvzz")
vim.keymap.set("n", "<C-]>", "<C-]>zvzz")
-- vim.keymap.set("n", "]d", "]dzvzz")
-- vim.keymap.set("n", "[d", "[dzvzz")
-- vim.keymap.set("n", "-", "<CMD>Fern . -reveal=%<CR>")
vim.keymap.set("n", "-", "<CMD>Oil<CR>")
vim.keymap.set("n", "<F5>", "<CMD>make<CR>")

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
    end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        init = function()
            vim.cmd.colorscheme 'tokyonight-night'
            vim.cmd.hi 'Comment gui=none'
            vim.cmd.hi 'Normal guibg=none ctermbg=none'
            vim.cmd.hi 'Folded guibg=none ctermbg=none'
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs',
        opts = {
            ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'markdown', 'markdown_inline', 'vim', 'vimdoc', 'odin', 'sql', 'json' },
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()
            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<leader>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
            vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<A-5>", function() harpoon:list():select(5) end)
            vim.keymap.set("n", "<A-6>", function() harpoon:list():select(6) end)
            vim.keymap.set("n", "<A-7>", function() harpoon:list():select(7) end)
            vim.keymap.set("n", "<A-8>", function() harpoon:list():select(8) end)
            vim.keymap.set("n", "<A-9>", function() harpoon:list():select(9) end)
        end
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup({})

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files)
            vim.keymap.set('n', '<leader>fg', builtin.live_grep)
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics)
            vim.keymap.set('n', '<leader>fh', builtin.help_tags)
            vim.keymap.set('n', '<leader>fr', builtin.resume)
        end
    },
    {
        'mbbill/undotree',
        dependencies = 'nvim-lua/plenary.nvim',
        opts = {},
        config = true,
        -- config = function()
        --     require("undotree").setup()
        -- end,
        keys = {{ '<leader>u', '<CMD>lua require("undotree").toggle()<CR>' }}
    },
    {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
            },
        },
        config = function()
            vim.lsp.enable('lua_ls')
            vim.lsp.enable('ols')
            vim.lsp.enable('gopls')
            vim.lsp.enable({ 'ts_ls', 'html', 'cssls' })
            vim.lsp.enable('pyright')

            vim.keymap.set("n", "<F1>", "<NOP>")
            vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename Symbol [LSP]" })
            vim.keymap.set("n", "<F3>", vim.lsp.buf.format, { desc = "Format File [LSP]" })
            vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, { desc = "Code Actions [LSP]" })
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = 'rounded' }) end)

            vim.diagnostic.config({ virtual_text = true })
        end,
    },
    { 'xiyaowong/transparent.nvim', priority = 1000, },
    { 'cappyzawa/trim.nvim', opts = {} },
    { 'lambdalisue/vim-fern', config = function() end, },
})
