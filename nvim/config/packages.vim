" ========================= Installing Packages ===================================================
call plug#begin('~/.config/nvim/plugged/')

" Colorscheme
Plug 'morhetz/gruvbox'

" Syntax highlighting, autocomplete and language support
Plug 'sheerun/vim-polyglot'                         " Syntax highlighting
Plug 'jiangmiao/auto-pairs'                         " Bracker pairs
Plug 'preservim/nerdcommenter'                      " Commenting
Plug 'Yggdroot/indentLine'                          " Show indentation levels
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Autocomplete
Plug 'rust-lang/rust.vim'                           " Rust lang support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  } " Golang support
Plug 'rhysd/vim-clang-format'                       " Clang-format helper for vim 'clang-format' has to be installed in system

" Statusline for vim
Plug 'vim-airline/vim-airline'

" Directories and files
Plug 'scrooloose/nerdtree'                                       " Directory explorer
Plug 'ryanoasis/vim-devicons'                                    " File icons in NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                   " File colors in NERDTree
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '~/.fzf/install' } " Fuzzy finder
Plug 'junegunn/fzf.vim'                                          " Fuzzy finder vim helper

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' " Shows git changes in gutter

" Misc
Plug 'junegunn/goyo.vim'       " Zen mode
Plug 'junegunn/vim-easy-align' " Align

call plug#end()

" ========================= Custom Settings for Packages ==========================================

colorscheme gruvbox         " Best Color Scheme ever

" Nerd Commenter settings
" Use Leader + / to toggle comments in normal and visual modes
vmap <Leader>/ <plug>NERDCommenterToggle<CR>gv
nmap <Leader>/ <plug>NERDCommenterToggle

" Vim-airline settings
let g:airline_powerline_fonts            = 1
let g:airline#extensions#tabline#enabled = 1

" For indentLine to work properly
set conceallevel=1

" Autoformat on save (rust.vim and clangd)
let g:rustfmt_autosave               = 1
let g:clang_format#auto_format       = 1
let g:clang_format#detect_style_file = 1

" vim-go settings
let g:go_fmt_autosave             = 1           " Auto format on save
let g:go_auto_type_info           = 1           " Show type info in statusline
let g:go_fmt_command              = "goimports"
let g:go_auto_sameids             = 1           " Autohighlight same ids

" Goyo (Zen Mode) settings
nmap <Leader>g :Goyo<CR>
let g:goyo_width  = 100
let g:goyo_height = "90%"
let g:goyo_linenr = 2       " Show line numbers in zen mode

" Easy Align
nmap ga <Plug>(EasyAlign)

" Fzf settings
let g:fzf_preview_window = 'right:50%'
nmap <C-f> :FZF<CR>
imap <C-f> <ESC>:FZF<CR>

" Mapping Ctrl+F5 for Rust and Go
command! -nargs=* RR up | execute "!cargo run" <q-args>
autocmd FileType rust nnoremap <buffer> <F5> :w <CR> :RR <CR>
autocmd FileType rust inoremap <buffer> <F5> :w <CR> :RR <CR>
autocmd FileType go   nnoremap <F5> :w <CR> :GoRun <CR>
autocmd FileType go   inoremap <F5> :w <CR> :GoRun <CR>

" ========================= NERDTree Settings =====================================================

" Toggle NERDTree with Leader-n
nmap     <Leader>n :NERDTreeToggle<Enter>
nnoremap <silent>  <Leader>nf :NERDTreeFind<CR>

" Ignore these folders
let g:NERDTreeIgnore = [
            \ '^[Tt]arget$',
            \ '^[Bb]uild$',
            \ '^[Dd]ist$',
            \ '^[Ee]nv$',
            \ '^__pycache__$',
            \ '^node_modules$'
            \]

" Open NERDTree by default and close if it is the only tab open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter     * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter     * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Custom NERDTree settings
let NERDTreeAutoDeleteBuffer                 = 1 " Automatically delete the buffer
let NERDTreeQuitOnOpen                       = 1 " Quit NERDTree when a file is opened
let NERDTreeDirArrowExpandable               = "►"
let NERDTreeDirArrowCollapsible              = "▼"

" vim-nerdtree-syntax-highlight settings to highlight filename along with icons
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName    = 1
let g:NERDTreePatternMatchHighlightFullName  = 1

" ========================= END ===================================================================
