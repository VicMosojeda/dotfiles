" Loaders Files for LSP configuration
for lsp_config_file in split(globpath('~/.config/nvim/config/', '**/*.vim'), '\n')
  execute 'source ' . lsp_config_file
endfor


" Use vim-plug to manage plugins
call plug#begin('~/.local/share/nvim/plugged')

" Packer (Not needed for vim-plug, but keeping for reference)
" Plug 'wbthomason/packer.nvim'

" Themes
Plug 'folke/tokyonight.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'scottmckendry/cyberdream.nvim'
Plug 'samharju/synthweave.nvim'

" Lua-line theme
Plug 'nvim-lualine/lualine.nvim'

" nvim-colorizer.lua
Plug 'norcalli/nvim-colorizer.lua'

" emmet-vim
Plug 'mattn/emmet-vim'

" Pane movement plugin
Plug 'christoomey/vim-tmux-navigator'

" codeium
Plug 'Exafunction/codeium.vim'

" nvim tree for sidebar & telescope
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'

" Autopairs
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

" Completions
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'

" Formatter (You can add specific formatter plugins here)

" LSP (Language Server Protocols)
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' } " for window like vscode
Plug 'jose-elias-alvarez/typescript.nvim'
Plug 'onsails/lspkind.nvim'

" Telescope setup, fuzzy finder
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'nvim-lua/plenary.nvim'

call plug#end()

" Optionally, automatically install missing plugins on startup
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | endif
