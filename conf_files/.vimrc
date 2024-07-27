" Setting up relative number. Ctrl + L to toggle
set relativenumber
inoremap <C-c> <ESC>

function! g:InserModeSetLine()
    set norelativenumber
    set number
endfunc
" setglobal relativenumber
autocmd InsertEnter * :call InserModeSetLine()
autocmd InsertLeave * :setlocal relativenumber

function! g:ToggleNuMode()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

map <C-ll> :call g:ToggleNuMode()<CR>

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d
" replace currently selected text with default register  without yanking it
vnoremap <leader>p "_dP

"" Config for NERDtree
autocmd VimEnter * NERDTree
let NERDTreeShowHidden=1
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"" Remap window split
nnoremap <C-w>\| :vsplit<CR>
nnoremap <C-w>- :split<CR>
nnoremap <C-w><C-h> :vertical resize -3<CR>
nnoremap <C-w><C-l> :vertical resize +3<CR>
nnoremap <C-w><C-j> :resize -3<CR>
nnoremap <C-w><C-k> :resize +3<CR>

let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2
map <Esc>h <A-h>
map <Esc>j <A-j>
map <Esc>k <A-k>
map <Esc>l <A-l>
nnoremap <A-h> :TmuxNavigateLeft<CR>
nnoremap <A-j> :TmuxNavigateDown<CR>
nnoremap <A-k> :TmuxNavigateUp<CR>
nnoremap <A-l> :TmuxNavigateRight<CR>


call plug#begin()
" List your plugins here
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
