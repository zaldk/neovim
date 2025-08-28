-- Colors (default theme in case plugins fail)
vim.cmd.colorscheme('habamax')
vim.cmd.hi 'Folded guibg=none ctermbg=none'


vim.g.mapleader = ' '                              -- Set leader key to space
vim.g.maplocalleader = ' '                         -- Set local leader key
vim.g.netrw_banner = 0                             -- Do not show the banner
vim.g.netrw_liststyle = 3                          -- Tree-like style

vim.opt.cursorline = false                         -- Highlight current line
vim.opt.number = true                              -- Line numbers
vim.opt.relativenumber = false                     -- Relative line numbers
vim.opt.scrolloff = 0                              -- Keep N lines above/below cursor
vim.opt.sidescrolloff = 0                          -- Keep N columns left/right of cursor
vim.opt.wrap = true                                -- Wrap lines

vim.opt.autoindent = true                          -- Copy indent from current line
vim.opt.expandtab = true                           -- Use spaces instead of tabs
vim.opt.shiftwidth = 4                             -- Indent width
vim.opt.smartindent = true                         -- Smart auto-indenting
vim.opt.softtabstop = 8                            -- Soft tab stop
vim.opt.tabstop = 8                                -- Tab width
vim.opt.hlsearch = false                           -- Don't highlight search results
vim.opt.ignorecase = true                          -- Case insensitive search
vim.opt.incsearch = true                           -- Show matches as you type
vim.opt.smartcase = true                           -- Case sensitive if uppercase in search

vim.opt.cmdheight = 1                              -- Command line height
vim.opt.colorcolumn = '80'                         -- Show column at 100 characters
vim.opt.completeopt = 'menu,longest'           -- Completion options
vim.opt.concealcursor = ''                         -- Don't hide cursor line markup
vim.opt.conceallevel = 0                           -- Don't hide markup
vim.opt.lazyredraw = true                          -- Don't redraw during macros
vim.opt.list = true                                -- Enable usage of special symbols instead of whitespace
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣'} -- Symbols to use instead of whitespace
vim.opt.matchtime = 2                              -- How long to show matching bracket
vim.opt.pumblend = 10                              -- Popup menu transparency
vim.opt.pumheight = 10                             -- Popup menu height
vim.opt.showmatch = false                          -- Highlight matching brackets
vim.opt.showmode = true                            -- Show mode in command line
vim.opt.signcolumn = 'yes'                         -- Always show sign column
vim.opt.synmaxcol = 1024                           -- Syntax highlighting limit
vim.opt.termguicolors = true                       -- Enable 24-bit colors
vim.opt.winblend = 0                               -- Floating window transparency
vim.opt.fillchars = [[eob: ,fold: ,foldopen:v,foldsep: ,foldclose:>]] -- Characters to use as fillers
vim.opt.winborder = 'rounded'                      -- All floating windows will have rounded borders

vim.opt.autoread = true                            -- Auto reload files changed outside vim
vim.opt.autowrite = false                          -- Don't auto save
vim.opt.backup = false                             -- Don't create backup files
vim.opt.swapfile = false                           -- Don't create swap files
vim.opt.timeoutlen = 500                           -- Key timeout duration
vim.opt.ttimeoutlen = 0                            -- Key code timeout
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')  -- Undo directory
vim.opt.undofile = true                            -- Persistent undo
vim.opt.updatetime = 300                           -- Faster completion
vim.opt.writebackup = false                        -- Don't create backup before writing
vim.opt.autochdir = false                          -- Don't auto change directory
vim.opt.backspace = 'indent,eol,start'             -- Better backspace behavior
vim.opt.clipboard:append('unnamedplus')            -- Use system clipboard
vim.opt.encoding = 'UTF-8'                         -- Set encoding
vim.opt.errorbells = false                         -- No error bells
vim.opt.hidden = true                              -- Allow hidden buffers
vim.opt.modifiable = true                          -- Allow buffer modifications
vim.opt.mouse = 'a'                                -- Enable mouse support
vim.opt.mousescroll = 'ver:1,hor:1'                -- Mouse scrolls N lines
vim.opt.path:append('**')                          -- include subdirectories in search
vim.opt.selection = 'inclusive'                    -- Selection includes cursor
vim.opt.splitbelow = true                          -- Horizontal splits go below
vim.opt.splitright = true                          -- Vertical splits go right
vim.cmd('autocmd BufEnter * set formatoptions-=cro') -- Remove autocomment when pressing `O`
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')
vim.opt.foldmethod = 'marker'                       -- Use markers `{{{` and `}}}` for folding
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- Use treesitter for folding
vim.opt.foldlevel = 99                              -- Start with all folds open
vim.opt.guicursor = 'n-v-ve-c-sm:block,i-ci:ver25,r-cr-o:hor20'

vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildoptions = 'fuzzy,pum,tagfile'
vim.opt.wildignorecase = true
vim.opt.wildignore:append({ '*.o', '*.obj', '*.pyc', '*.class', '*.jar' })

vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000



vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<F1>', '<NOP>')
vim.keymap.set({ 'v', 'x' }, 'p', 'P')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-d>', '<C-d>zzzv')
vim.keymap.set('n', '<C-u>', '<C-u>zzzv')

vim.keymap.set({ 'n', 'v' }, 'x', '"_x')

vim.keymap.set('n', '<A-n>', ':cnext<CR>')
vim.keymap.set('n', '<A-N>', ':cprev<CR>')

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set({'n','i','v','x'}, '<S-Up>',   '<Up>')
vim.keymap.set({'n','i','v','x'}, '<S-Down>', '<Down>')

vim.keymap.set('n', 'J', 'mzJ`z')

vim.keymap.set('t', '<ESC>', '<C-\\><C-N>')



local augroup = vim.api.nvim_create_augroup('UserConfig', {})
vim.api.nvim_create_autocmd('TextYankPost', { -- Highlight yanked text
    group = augroup,
    callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_autocmd('BufReadPost', { -- Return to last edit position when opening files
    group = augroup,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, "'")
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

vim.api.nvim_create_autocmd('VimResized', { -- Auto-resize splits when window is resized
    group = augroup,
    callback = function() vim.cmd('tabdo wincmd =') end,
})

vim.api.nvim_create_autocmd('BufWritePre', { -- Create directories when saving files
    group = augroup,
    callback = function()
        local dir = vim.fn.expand('<afile>:p:h')
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, 'p')
        end
    end,
})

local undodir = vim.fn.expand('~/.vim/undodir') -- Create undo directory if it doesn't exist
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, 'p')
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<F3>', vim.lsp.buf.format, opts)
        vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
    end,
})

vim.diagnostic.config({ severity_sort = true })

vim.pack.add({
    'https://github.com/folke/tokyonight.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/echasnovski/mini.files',
    'https://github.com/echasnovski/mini.pick',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-lua/plenary.nvim',
    { src = 'https://github.com/ThePrimeagen/harpoon', version = 'ed1f853847ffd04b2b61c314865665e1dadf22c7' },
})

vim.cmd.colorscheme('tokyonight-night') -- habamax
vim.cmd.hi 'Folded guibg=none'

local function setup_lsp()
    vim.lsp.enable({ 'lua_ls', 'bashls', 'ols', 'gopls' })
    vim.lsp.config('lua_ls', { settings = { Lua = { workspace = { library = vim.api.nvim_get_runtime_file('',true) }}} })

    -- C is beyond lsp
    vim.opt.tags:append('./tags;~/')
    vim.api.nvim_create_autocmd('BufWritePost', {
        pattern = '*.c,*.h,*.cpp,*.hpp',
        command = 'silent exec "!ctags -R --kinds-c=+p --fields=+S --extras=+q ."'
    })
end setup_lsp()

local function setup_mini_files()
    local MiniFiles = require('mini.files')
    vim.keymap.set('n', '-', function()
        local buf_name = vim.api.nvim_buf_get_name(0)
        local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
        MiniFiles.open(path)
        MiniFiles.reveal_cwd()
    end, { desc = 'Open Mini Files' })
    MiniFiles.setup({
        mappings = {
            close       = '<ESC>',
            go_in       = '<Right>',
            go_in_plus  = '<CR>',
            go_out      = '<Left>',
        },
        content = { prefix = function() end },
        -- options = { use_as_default_explorer = false },
    })
    vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesWindowUpdate',
        callback = function(args)
            local win_id = args.data.win_id
            local config = vim.api.nvim_win_get_config(win_id)
            config.row = 10
            vim.api.nvim_win_set_config(win_id, config)
        end,
    })

end setup_mini_files()

local function setup_mini_pick()
    require('mini.pick').setup({})
    vim.keymap.set('n', '<leader>fb', ':Pick buffers<CR>')
    vim.keymap.set('n', '<leader>ff', ':Pick files<CR>')
    vim.keymap.set('n', '<leader>fg', ':Pick grep_live<CR>')
    vim.keymap.set('n', '<leader>fh', ':Pick help<CR>')
    vim.keymap.set('n', '<leader>fr', ':Pick resume<CR>')
end setup_mini_pick()

local function setup_treesitter()
    require('nvim-treesitter.configs').setup {
        ensure_installed = { 'odin', 'go' },
        sync_install = false,
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        modules = {},
        ignore_install = {},
    }
end setup_treesitter()

local function setup_harpoon()
    local harpoon = require('harpoon')
    harpoon:setup()
    vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
    vim.keymap.set('n', '<leader>m', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    for i = 1, 9 do vim.keymap.set('n', '<A-'..i..'>', function() harpoon:list():select(i) end) end
end setup_harpoon()
