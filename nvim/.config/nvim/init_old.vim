" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath

let mapleader=" "

set number
set relativenumber
set backupdir=/tmp
set directory=/tmp
set noswapfile
set nowrap
set nohlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smartcase
set incsearch
set undodir=~/.local/share/nvim/undodir
set undofile
set noerrorbells
set hidden

call plug#begin('~/.local/share/nvim/plugged')
Plug 'Murtaza-Udaipurwala/gruvqueen'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'lewis6991/gitsigns.nvim'
Plug 'TimUntersberger/neogit'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'rust-lang/rust.vim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'j-hui/fidget.nvim'
Plug 'nvim-orgmode/orgmode'
" Plug 'mfussenegger/nvim-dap'
Plug 'mbbill/undotree'
call plug#end()

" let g:gruvbox_contrast_dark = 'medium'
" colorscheme gruvbox " vim gruvbox
set background=dark " or 'light' if you so prefer
let g:gruvqueen_transparent_background = v:true
" let g:gruvqueen_background_color = '#10151a'
let g:gruvqueen_disable_bold = v:false
let g:gruvqueen_italic_comments = v:true
let g:gruvqueen_italic_keywords = v:true
let g:gruvqueen_italic_functions = v:true
let g:gruvqueen_italic_variables = v:true
let g:gruvqueen_invert_selection = v:true
let g:gruvqueen_style = 'mix' " possible values: 'original', 'mix', 'material'
colorscheme gruvqueen

lua require('lualine').setup()
set laststatus=2

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>
nnoremap <leader>fm <cmd>Telescope marks<cr>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

" Open chadtree
nnoremap <leader>v <cmd>CHADopen<cr>

" COQ completion
" let g:coq_settings = { 'auto_start': v:true }
let g:coq_settings = { 'auto_start': 'shut-up' }

lua require'lsp'
" lua require'dap_config'
lua require'gitsigns'.setup()
lua require'fidget'.setup{}

lua << EOF
-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/org/*', '~/org/**/*'},
  org_default_notes_file = '~/org/notes.org',
})
EOF

