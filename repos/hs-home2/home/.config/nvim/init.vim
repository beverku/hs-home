" use pathogen for plugin management
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"""""""""""""""""""""""""""
" GENERAL SETTINGS
"""""""""""""""""""""""""""
set nocompatible           " no vi compatibility
filetype on                " enable filetype detection
filetype indent on         " enable filetype-specific indenting
filetype plugin on         " enable filetype-specific plugins
set lazyredraw             " don't redraw screen while running macros etc
set fileformat=unix        " prefer Unix line endings
set fileformats=unix,dos
set autoread               " automatically reload files when changed outside vim
set nobackup               " don't create backup files while editing
set noswapfile             " don't create swap files while editing
set writebackup            " use backup when saving files
set hidden                 " Allow switching buffers without saving
set noeb vb t_vb=          " Turn off error bells

"""""""""""""""""""""""""""
" COPY PASTE
"""""""""""""""""""""""""""
source $VIMRUNTIME/mswin.vim
behave mswin

"""""""""""""""""""""""""""
" INTERFACE APPEARANCE
"""""""""""""""""""""""""""
syntax on                  " syntax highlighting
set termguicolors
set laststatus=2           " status line always on
set number                 " show line numbers
let g:airline_powerline_fonts = 1
colorscheme lucius
LuciusDark
hi LineNr ctermfg=252
hi VertSplit ctermfg=252 ctermbg=254
hi Search ctermbg=254
hi link xmlEndTag Function
hi link xmlAttrib Statement
hi clear swiftKeywords
hi link swiftKeywords Function
hi link sqlKeyword Function
hi link sqlStatement Function

"""""""""""""""""""""""""""
" SEARCH BEHAVIOR
"""""""""""""""""""""""""""
set incsearch              " start searching before pressing enter
set hlsearch               " highlight search results

"""""""""""""""""""""""""""
" TABS
"""""""""""""""""""""""""""
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set listchars=tab:⟶\ 
set list
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype eruby setlocal ts=2 sw=2 expandtab

"""""""""""""""""""""""""""
" Syntax
"""""""""""""""""""""""""""
" let g:jsx_ext_required = 0

"""""""""""""""""""""""""""
" Fuzzy Finder
"""""""""""""""""""""""""""
let g:fuf_file_exclude = '\v\~$|\.o$|\.exe$|\.bak$|\.swp$|\.class$|.*node_modules.*'

"""""""""""""""""""""""""""
" deoplete
" https://github.com/Shougo/deoplete.nvim
"""""""""""""""""""""""""""
let g:deoplete#enable_at_startup=1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'

"""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""
" indent file and return to curent line
nmap <C-i> gg=G''

" map ; to : in normal mode so I don't have to hold down shift
nmap ; :

" use , as <leader> instead of \
let mapleader = ","

" press enter in normal mode to clear search highlighting
" Messes with hitting enter to expand in debug window?
" nnoremap <cr> :noh<cr>

" shortcut to turn on paste mode
map <leader>p :setlocal paste!<cr>

" shortcut to run JSHint
" imap <leader>j :JSHint<cr>

" shortcut to toggle line numbers
map <leader>ln :setlocal number!<cr>

" switch windows with leader-w
nmap <leader>w <c-w><c-w>

" close window with leader-q
nmap <leader>q <c-w>q

" FuzzyFind buffer with leader b
nmap <leader>b :FufBuffer<cr>

" FuzzyFind file with leader f
nmap <leader>f :FufFile<cr>

" Find and replace current word with leader-r
nmap <leader>r :%s/\<<c-r><c-w>\>





"""""""""""""""""""""""""""
" Eclipse key mappings - not provided by eclim
"""""""""""""""""""""""""""
" let g:EclimCompletionMethod='omnifunc'
imap <NUL> <C-x><C-o>

"""""""""""""""""""""""""""
" eclim Key mappings
" See: http://eclim.org/cheatsheet.html
"""""""""""""""""""""""""""
" <C-A-h> Doesn't work - use leader-h
" nmap <leader>h :JavaCallHierarchy<Enter>
" nmap <F4> :JavaHierarchy<Enter>
" nmap <C-r> :JUnit<Enter:q
" nmap <C-j> :JUnitFindTest<Enter>
" nmap <C-S-o> :JavaImportOrganize<Enter>
"Note :JavaSearch will take you to the method decleration or if you are at a
"method decleration already it will show uses
" nmap <F3> :JavaSearch<Enter>
" <C-1> Doesn't work - use leader-jf i.e. Java quick Fix
" nmap <leader>jf :JavaCorrect<Enter>
" nmap <F2> :JavaDocPreview<Enter>
" nmap <A-S-r> :JavaRename 

" nmap <leader>p :ProjectProblems<Enterkjkkk

" Debug - run ./gradlew run --debug-jvm first
" nmap <leader>jdb :JavaDebugStart localhost 5005<Enter>
" nmap <leader>jdbs :JavaDebugStatus<Enter>

" Breakpoints - list, toggle, delete
" nmap <leader>lbp :JavaDebugBreakpointsList<Enter>
" nmap <leader>bp :JavaDebugBreakpointToggle<Enter>
" nmap <leader>dbp :JavaDebugBreakpointToggle!<Enter>o

" Debug step
" nmap <F5> :JavaDebugStep into<Enter>
" nmap <F6> :JavaDebugStep over<Enter>
" nmap <F7> :JavaDebugStep return<Enter>
" nmap <F8> :JavaDebugThreadResumeAll<Enter>
