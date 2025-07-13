-- Basic settings
vim.opt.cursorline = false                         -- Highlight current line
vim.opt.number = true                              -- Line numbers
vim.opt.relativenumber = false                     -- Relative line numbers
vim.opt.scrolloff = 0                              -- Keep N lines above/below cursor
vim.opt.sidescrolloff = 0                          -- Keep N columns left/right of cursor
vim.opt.wrap = true                                -- Wrap lines

-- Indentation
vim.opt.autoindent = true                          -- Copy indent from current line
vim.opt.expandtab = true                           -- Use spaces instead of tabs
vim.opt.shiftwidth = 4                             -- Indent width
vim.opt.smartindent = true                         -- Smart auto-indenting
vim.opt.softtabstop = 4                            -- Soft tab stop
vim.opt.tabstop = 4                                -- Tab width

-- Search settings
vim.opt.hlsearch = false                           -- Don't highlight search results
vim.opt.ignorecase = true                          -- Case insensitive search
vim.opt.incsearch = true                           -- Show matches as you type
vim.opt.smartcase = true                           -- Case sensitive if uppercase in search

-- Visual settings
vim.opt.cmdheight = 1                              -- Command line height
vim.opt.colorcolumn = '100'                        -- Show column at 100 characters
vim.opt.completeopt = 'menuone,noinsert,noselect'  -- Completion options
vim.opt.concealcursor = ''                         -- Don't hide cursor line markup
vim.opt.conceallevel = 0                           -- Don't hide markup
vim.opt.lazyredraw = true                          -- Don't redraw during macros
vim.opt.matchtime = 2                              -- How long to show matching bracket
vim.opt.pumblend = 10                              -- Popup menu transparency
vim.opt.pumheight = 10                             -- Popup menu height
vim.opt.showmatch = false                          -- Highlight matching brackets
vim.opt.showmode = false                           -- Don't show mode in command line
vim.opt.signcolumn = 'no'                          -- Always show sign column
vim.opt.synmaxcol = 300                            -- Syntax highlighting limit
vim.opt.termguicolors = true                       -- Enable 24-bit colors
vim.opt.winblend = 0                               -- Floating window transparency
vim.opt.fillchars = [[eob: ,fold: ,foldopen:v,foldsep: ,foldclose:>]] -- Characters to use as fillers

-- File handling
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

-- Behavior settings
vim.opt.autochdir = false                          -- Don't auto change directory
vim.opt.backspace = 'indent,eol,start'             -- Better backspace behavior
vim.opt.clipboard:append('unnamedplus')            -- Use system clipboard
vim.opt.encoding = 'UTF-8'                         -- Set encoding
vim.opt.errorbells = false                         -- No error bells
vim.opt.hidden = true                              -- Allow hidden buffers
vim.opt.iskeyword:remove('_')                      -- Do not treat underscore as part of a word
vim.opt.modifiable = true                          -- Allow buffer modifications
vim.opt.mouse = 'a'                                -- Enable mouse support
vim.opt.mousescroll = 'ver:1,hor:1'                -- Mouse scrolls N lines
vim.opt.path:append('**')                          -- include subdirectories in search
vim.opt.selection = 'inclusive'                    -- Selection behavior
vim.cmd('autocmd BufEnter * set formatoptions-=cro') -- Remove autocomment when pressing `O`
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- Cursor settings
vim.opt.guicursor = 'n-v-ve-c-sm:block,i-ci:ver25,r-cr-o:hor20' --,t:block-blinkon500-blinkoff500-TermCursor'
-- vim.opt.guicursor = 'a:block,i-ci:ver10,r-cr:hor20,o:hor50'

-- Folding settings
vim.opt.foldmethod = 'expr'                         -- Use expression for folding
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- Use treesitter for folding
vim.opt.foldlevel = 99                              -- Start with all folds open

-- Split behavior
vim.opt.splitbelow = true                          -- Horizontal splits go below
vim.opt.splitright = true                          -- Vertical splits go right

-- Key mappings
vim.g.mapleader = ' '                              -- Set leader key to space
vim.g.maplocalleader = ' '                         -- Set local leader key (NEW)

-- Normal mode mappings
-- vim.keymap.set('n', '<leader>c', ':nohlsearch<CR>', { desc = 'Clear search highlights' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Clear search highlights' })

-- Center screen when jumping
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })
vim.keymap.set('n', '<C-d>', '<C-d>zzzv', { desc = 'Half page down (centered)' })
vim.keymap.set('n', '<C-u>', '<C-u>zzzv', { desc = 'Half page up (centered)' })

-- Delete without yanking
-- vim.keymap.set({ 'n', 'v' }, '<leader>d', ''_d', { desc = 'Delete without yanking' })
vim.keymap.set({ 'n', 'v' }, 'x', '"_x', { desc = 'Delete without yanking' })

-- Buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Splitting & Resizing
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>sh', ':split<CR>', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<C-S-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-S-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-S-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-S-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- Move lines up/down
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Better indenting in visual mode
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Quick file navigation
-- vim.keymap.set('n', '<leader>e', ':Explore<CR>', { desc = 'Open file explorer' })
-- vim.keymap.set('n', '<leader>ff', ':find ', { desc = 'Find file' })

-- Better J behavior
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines and keep cursor position' })

-- Quick config editing
vim.keymap.set('n', '<leader>rc', ':e ~/.config/nvim/init.lua<CR>', { desc = 'Edit config' })

-- ============================================================================
-- USEFUL FUNCTIONS
-- ============================================================================

-- Copy Full File-Path
vim.keymap.set('n', '<leader>pa', function()
    local path = vim.fn.expand('%:p')
    vim.fn.setreg('+', path)
    print('file:', path)
end)

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup('UserConfig', {})

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    group = augroup,
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd('BufReadPost', {
    group = augroup,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, "'")
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- -- Set filetype-specific settings
-- vim.api.nvim_create_autocmd('FileType', {
--     group = augroup,
--     pattern = { 'lua', 'python' },
--     callback = function()
--         vim.opt_local.tabstop = 4
--         vim.opt_local.shiftwidth = 4
--     end,
-- }))

-- Auto-close terminal when process exits
vim.api.nvim_create_autocmd('TermClose', {
    group = augroup,
    callback = function()
        if vim.v.event.status == 0 then
            vim.api.nvim_buf_delete(0, {})
        end
    end,
})

-- Disable line numbers in terminal
vim.api.nvim_create_autocmd('TermOpen', {
    group = augroup,
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = 'no'
    end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd('VimResized', {
    group = augroup,
    callback = function()
        vim.cmd('tabdo wincmd =')
    end,
})

-- Create directories when saving files
vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    callback = function()
        local dir = vim.fn.expand('<afile>:p:h')
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, 'p')
        end
    end,
})

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildoptions = 'fuzzy,pum,tagfile'
vim.opt.wildignorecase = true
vim.opt.wildignore:append({ '*.o', '*.obj', '*.pyc', '*.class', '*.jar' })

-- Better diff options
vim.opt.diffopt:append('linematch:60')

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand('~/.vim/undodir')
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, 'p')
end

-- ============================================================================
-- FLOATING TERMINAL
-- ============================================================================

-- terminal
local terminal_state = {
    buf = nil,
    win = nil,
    is_open = false
}

local function FloatingTerminal()
    -- If terminal is already open, close it (toggle behavior)
    if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
        vim.api.nvim_win_close(terminal_state.win, false)
        terminal_state.is_open = false
        return
    end

    -- Create buffer if it doesn't exist or is invalid
    if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
        terminal_state.buf = vim.api.nvim_create_buf(false, true)
        -- Set buffer options for better terminal experience
        vim.api.nvim_buf_set_option(terminal_state.buf, 'bufhidden', 'hide')
    end

    -- Calculate window dimensions
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    -- Create the floating window
    terminal_state.win = vim.api.nvim_open_win(terminal_state.buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        style = 'minimal',
        border = 'rounded',
    })

    -- Set transparency for the floating window
    vim.api.nvim_win_set_option(terminal_state.win, 'winblend', 0)

    -- Set transparent background for the window
    vim.api.nvim_win_set_option(terminal_state.win, 'winhighlight', 'Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder')

    -- Define highlight groups for transparency
    vim.api.nvim_set_hl(0, 'FloatingTermNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatingTermBorder', { bg = 'none', })

    -- Start terminal if not already running
    local has_terminal = false
    local lines = vim.api.nvim_buf_get_lines(terminal_state.buf, 0, -1, false)
    for _, line in ipairs(lines) do
        if line ~= '' then
            has_terminal = true
            break
        end
    end

    if not has_terminal then
        vim.fn.termopen(os.getenv('SHELL'))
    end

    terminal_state.is_open = true
    vim.cmd('startinsert')

    -- Set up auto-close on buffer leave
    vim.api.nvim_create_autocmd('BufLeave', {
        buffer = terminal_state.buf,
        callback = function()
            if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
                vim.api.nvim_win_close(terminal_state.win, false)
                terminal_state.is_open = false
            end
        end,
        once = true
    })
end

-- Function to explicitly close the terminal
local function CloseFloatingTerminal()
    if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
        vim.api.nvim_win_close(terminal_state.win, false)
        terminal_state.is_open = false
    end
end

-- Key mappings
vim.keymap.set('n', '<leader>t', FloatingTerminal, { noremap = true, silent = true, desc = 'Toggle floating terminal' })
vim.keymap.set('t', '<Esc>', function()
    if terminal_state.is_open then
        vim.api.nvim_win_close(terminal_state.win, false)
        terminal_state.is_open = false
    end
end, { noremap = true, silent = true, desc = 'Close floating terminal from terminal mode' })

-- ============================================================================
-- STATUSLINE
-- ============================================================================

-- Git branch function
-- local function git_branch()
--     return vim.fn.system('git branch --show-current 2>/dev/null | tr -d "\n"')
-- end

-- File type with icon
local function file_type()
    local ft = vim.bo.filetype
    local icons = {
        lua = '[LUA]',
        odin = '[ODIN]',
        python = '[PY]',
        javascript = '[JS]',
        html = '[HTML]',
        css = '[CSS]',
        json = '[JSON]',
        markdown = '[MD]',
        vim = '[VIM]',
        sh = '[SH]',
    }

    if ft == '' then
        return '  '
    end

    return (icons[ft] or ft)
end

-- LSP status
local function lsp_status()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients > 0 then
        return 'LSP ('..(clients[1].config.name or '')..')'
    end
    return ''
end

-- Word count for text files
-- local function word_count()
--     local ft = vim.bo.filetype
--     if ft == 'markdown' or ft == 'text' or ft == 'tex' then
--         local words = vim.fn.wordcount().words
--         return '  ' .. words .. ' words '
--     end
--     return ''
-- end

-- File size
local function file_size()
    local size = vim.fn.getfsize(vim.fn.expand('%'))
    if size < 0 then return '' end
    if size < 1024 then
        return size .. 'B '
    elseif size < 1024 * 1024 then
        return string.format('%.1fK', size / 1024)
    else
        return string.format('%.1fM', size / 1024 / 1024)
    end
end

-- Mode indicators with icons
local function mode_icon()
    local mode = vim.fn.mode()
    local modes = {
        n       = 'NORMAL',
        i       = 'INSERT',
        v       = 'VISUAL',
        V       = 'V-LINE',
        ['\22'] = 'V-BLOCK',  -- Ctrl-V
        c       = 'COMMAND',
        s       = 'SELECT',
        S       = 'S-LINE',
        ['\19'] = 'S-BLOCK',  -- Ctrl-S
        R       = 'REPLACE',
        r       = 'REPLACE',
        ['!']   = 'SHELL',
        t       = 'TERMINAL',
    }
    return modes[mode] or '  ' .. mode:upper()
end

_G.mode_icon = mode_icon
-- _G.git_branch = git_branch
_G.file_type = file_type
_G.file_size = file_size
_G.lsp_status = lsp_status

vim.cmd('highlight StatusLineBold gui=bold cterm=bold')

-- Function to change statusline based on window focus
local function setup_dynamic_statusline()
    vim.api.nvim_create_autocmd({'WinEnter', 'BufEnter', 'WinLeave', 'BufLeave'}, {
        callback = function()
            vim.opt_local.statusline = table.concat {
                ' ',
                '%#StatusLineBold#',
                '%{v:lua.mode_icon()}',
                '%#StatusLine#',
                ' | ',
                '%f%h%m%r',
                ' | ',
                -- '%{v:lua.git_branch()}',
                -- ' | ',
                '%{v:lua.file_type()}',
                ' | ',
                '%{v:lua.file_size()}',
                ' | ',
                '%{v:lua.lsp_status()}',
                '%=',
                '%l:%c  %P ',
            }
        end
    })
    vim.api.nvim_set_hl(0, 'StatusLineBold', { bold = true })

    -- vim.api.nvim_create_autocmd({'WinLeave', 'BufLeave'}, {
    --     callback = function()
    --         vim.opt_local.statusline = '  %f %h%m%r | %{v:lua.file_type()} | %=  %l:%c   %P '
    --     end
    -- })
end
setup_dynamic_statusline()

-- ============================================================================
-- LSP
-- ============================================================================

-- Function to find project root
local function find_root(patterns)
    local path = vim.fn.expand('%:p:h')
    local root = vim.fs.find(patterns, { path = path, upward = true })[1]
    return root and vim.fn.fnamemodify(root, ':h') or path
end

-- Shell LSP setup
local function setup_shell_lsp()
    vim.lsp.start({
        name = 'bashls',
        cmd = {'bash-language-server', 'start'},
        filetypes = {'sh', 'bash'},
        root_dir = find_root({'.git', 'Makefile'}),
        settings = {
            bashIde = {
                globPattern = '*@(.sh|.inc|.bash|.command)'
            }
        }
    })
end

-- Odin LSP setup
local function setup_odin_lsp()
    vim.lsp.start({
        name = 'ols',
        cmd = {'ols'},
        filetypes = {'odin'},
        root_dir = find_root({'ols.json', '.git', '*.odin'}),
    })
end

-- Lua LSP setup
local function setup_lua_lsp()
    vim.lsp.start({
        name = 'luals',
        cmd = {'lua-language-server'},
        filetypes = {'lua'},
        root_dir = find_root({ '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' }),
    })
end

-- Auto-start LSPs based on filetype
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'sh,bash,zsh',
    callback = setup_shell_lsp,
    desc = 'Start shell LSP'
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'odin',
    callback = setup_odin_lsp,
    desc = 'Start odin LSP'
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'lua',
    callback = setup_lua_lsp,
    desc = 'Start lua LSP'
})

-- LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = {buffer = event.buf}

        -- Navigation
        -- vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts)
        -- vim.keymap.set('n', 'gs', vim.lsp.buf.declaration, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

        -- Information
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = 'rounded' }) end)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

        -- Code actions
        vim.keymap.set("n", "<F1>", "<NOP>")
        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename Symbol [LSP]" })
        vim.keymap.set("n", "<F3>", vim.lsp.buf.format, { desc = "Format File [LSP]" })
        vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, { desc = "Code Actions [LSP]" })

        -- Diagnostics
        vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>dN', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
        -- vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
    end,
})

-- Better LSP UI
vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = 'E',
            [vim.diagnostic.severity.WARN]  = 'W',
            [vim.diagnostic.severity.INFO]  = 'I',
            [vim.diagnostic.severity.HINT]  = 'H',
        }
    },
})

vim.api.nvim_create_user_command('LspInfo', function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then
        print('No LSP clients attached to current buffer')
    else
        for _, client in ipairs(clients) do
            print('LSP: ' .. client.name .. ' (ID: ' .. client.id .. ')')
        end
    end
end, { desc = 'Show LSP client info' })

-- ============================================================================
-- Plugins
-- ============================================================================

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
            vim.cmd.colorscheme('tokyonight-night') -- habamax also works
            vim.cmd.hi 'Comment gui=none'
            vim.cmd.hi 'Normal guibg=none ctermbg=none'
            vim.cmd.hi 'Folded guibg=none ctermbg=none'
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
        end,
    },
    {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true
        },
        init = function()
            vim.keymap.set('n', '-', ':Oil<CR>', { desc = 'Open Oil explorer' })
        end,
    },
    -- {
    --     'nvim-treesitter/nvim-treesitter',
    --     build = ':TSUpdate',
    --     main = 'nvim-treesitter.configs',
    --     opts = {
    --         ensure_installed = { 'odin' },
    --         auto_install = false,
    --         highlight = { enable = true },
    --         indent = { enable = true },
    --     },
    -- },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local harpoon = require('harpoon')
            harpoon:setup()
            vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
            vim.keymap.set('n', '<leader>m', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
            for i = 1, 9 do vim.keymap.set('n', '<A-'..i..'>', function() harpoon:list():select(i) end) end
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
})
