" Setting up relative number. Ctrl + L to toggle
set relativenumber
inoremap <C-c> <ESC>
set tabstop=4
set shiftwidth=4
" Make cursor underscore when enter Insert Mode
let &t_SI = "\e[4 q"
let &t_EI = "\e[2 q"

"" Setup NerdFont
set encoding=UTF-8
set guifont=Overpass\ Nerd\ Font\ 14

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
" autocmd VimEnter * NERDTree
let NERDTreeShowHidden=1
nnoremap <C-b> :NERDTreeToggle<CR>
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
nnoremap <silent> <A-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <A-j> :TmuxNavigateDown<CR>
nnoremap <silent> <A-k> :TmuxNavigateUp<CR>
nnoremap <silent> <A-l> :TmuxNavigateRight<CR>

" Setting hotkey
nnoremap <C-d> :t.<CR> " Duplicate current line
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

"Commenting blocks of code.
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> <C-_> :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>   " Ctrl + / : to comment
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>  " ,cu : to uncomment


call plug#begin()
" List your plugins here
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'NLKNguyen/papercolor-theme'
Plug 'preservim/tagbar'
call plug#end()

"" Color scheme setting
set t_Co=256
set background=dark
colorscheme PaperColor

"" fzf Setting
set rtp+=~/.fzf
nnoremap <C-f> :Ag<CR>
nnoremap <C-i> :Buffers<CR>
nnoremap <C-k> :Windows<CR>
nnoremap ff :Files<CR>

"" Tagbar Outliner
nmap <F8> :TagbarToggle<CR>
let g:tagbar_map_zoomwin = "zlk"
let g:tagbar_map_closefold = "x" 	 " to map hotkey with the NerdTre
let g:tagbar_map_closeallfolds = "X" " to map hotkey with the NerdTre
let g:tagbar_map_openallfolds = "O"  " to map hotkey with the NerdTre




