" clipboard
set clipboard=unnamedplus
set relativenumber
set number
set tabstop=2
set shiftwidth=2
set expandtab

" Definir el líder de los mapeos
let g:mapleader = " "

" Mapear guardar el archivo
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>

" Mapear cerrar buffer
nnoremap <C-w> :bd<CR>
inoremap <C-w> <C-o>:bd<CR>

" Mapear salir de Neovim
nnoremap <C-q> :q<CR>
inoremap <C-q> <C-o>:q<CR>

" Mapear abrir terminal
nnoremap <C-t> :terminal<CR>
inoremap <C-t> <C-o>:terminal<CR>

" Configuración de Telescope
nnoremap <leader><leader> :lua require('telescope.builtin').find_files()<CR>
nnoremap <Space>c :lua require('telescope.builtin').oldfiles()<CR>
nnoremap <Space>fg :lua require('telescope.builtin').live_grep()<CR>
nnoremap <Space>fh :lua require('telescope.builtin').help_tags()<CR>

