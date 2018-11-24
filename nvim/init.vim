""" Platy's Neovim config

""" Vim-Plug
call plug#begin()

" Aesthetics
Plug 'liuchengxu/space-vim-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/goyo.vim'

" Functionalities
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/LargeFile'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'

call plug#end()


""" Coloring
let g:space_vim_dark_background = 234
syntax on
colorscheme space-vim-dark
highlight clear Comment
highlight Comment cterm=italic guifg=#7c7c7c
set number
set termguicolors
highlight Normal ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE


""" Other config
set encoding=UTF-8
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ai " Autoindent
set si " Smartindent
set wrap " Wrap lines
set tabstop=4 shiftwidth=4 
set tabstop=4
set softtabstop=4
set expandtab
set list listchars=tab:»·,trail:·,nbsp:·
set cursorline
set splitright
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " Return to last edit position
au TermOpen * setlocal nonumber norelativenumber


""" Optimisation config
set lazyredraw
set ttyfast
set foldmethod=syntax
set foldmethod=expr
set noshowcmd
set noruler
" set eventignore=all " Uncommenting this line stops deoplete and gitgutter from working


""" Mappings

" Ctrl-o to open sidebar
nmap <C-o> :NERDTreeToggle<CR>

" Better window switching
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Better tab switching
"nnoremap <silent> <tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
"nnoremap <silent> <s-tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
nmap <C-t> :tabnew<CR>

" Activate rainbow parentheses \r
nmap <leader>r :RainbowParentheses!!<CR>

" Activate Limelight \l
nmap <leader>l :Limelight!!<CR>

" Activate Goyo \G
nmap <leader>G :Goyo <bar> :highlight clear Comment <CR> :highlight Normal ctermbg=NONE guibg=NONE <CR> :highlight LineNr ctermbg=NONE guibg=NONE <CR> :highlight SignColumn ctermbg=NONE guibg=NONE <CR>

" Activate Deoplete \d
nmap <leader>d :call deoplete#toggle()<CR>

" Activate GitGutter \g
nmap <leader>g :GitGutterToggle<CR> 

" Spawn shell \s
nmap <leader>s :vsp \| term<CR> i

" UndoTree
nmap <C-i> :UndotreeToggle<CR>

" Vim Fugitive
nnoremap <silent> <leader>gp :Gpull -pr<CR>
nnoremap <silent> <leader>gf :Gfetch -p<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>

" Allow better window switching in terminal mode
augroup vimrc_term
    autocmd!
    autocmd WinEnter term://* nohlsearch
    autocmd WinEnter term://* startinsert
    autocmd TermOpen * tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
    autocmd TermOpen * tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
    autocmd TermOpen * tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
    autocmd TermOpen * tnoremap <buffer> <C-l> <C-\><C-n><C-w>l
    autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
augroup END

""" Vim Airline
let g:airline_powerline_fonts = 1
let g:airline_section_warning = ''
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_theme='solarized_flood'
let g:airline#extensions#tabline#enabled = 1
let g:airline_solarized_bg='dark'


""" Limelight
let g:limelight_conceal_ctermfg = 254
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'


""" Rainbow Parentheses
" au VimEnter * RainbowParentheses " Enable Rainbow Parentheses by default


""" Git Gutter
" set signcolumn=yes
" au VimEnter * GitGutterDisable
set updatetime=50


""" NERD Tree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
