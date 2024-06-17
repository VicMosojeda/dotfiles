" Configuración de NerdTree
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" Activar termguicolors para resaltar grupos
set termguicolors

" Configurar NvimTree
lua require('nvim-tree').setup()

" Abrir/cerrar NvimTree
nnoremap <C-z> :NvimTreeToggle<CR>

