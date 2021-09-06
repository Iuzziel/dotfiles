set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set number
set relativenumber
set backupdir=/tmp
set directory=/tmp
set noswapfile
" set nowrap
set nohlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smartcase
set incsearch
set undodir=~/.vim/undodir
set undofile
set noerrorbells
set hidden

let g:gruvbox_contrast_dark = 'medium'
set background=dark
colorscheme gruvbox

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'rust-lang/rust.vim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
call plug#end()

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

" Treesitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

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

lua require("lsp")
lua require("gitsigns").setup()
lua require("coq")
