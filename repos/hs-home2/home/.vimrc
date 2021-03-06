" use pathogen for plugin management
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" GENERAL SETTINGS
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
set mouse=a                " Mouse mode

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    " For all text files set 'textwidth' to 78 characters.
    " autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

" COPY PASTE
source $VIMRUNTIME/mswin.vim
behave mswin

set listchars+=tab:⟶\ ,eol:\  
set list

" INTERFACE APPEARANCE
syntax on                  " syntax highlighting
set laststatus=2           " status line always on
set number                 " show line numbers
let g:airline_powerline_fonts = 1
"colorscheme lucius
"LuciusDark
hi LineNr ctermfg=252
hi VertSplit ctermfg=252 ctermbg=254
hi Search ctermbg=254
hi link xmlEndTag Function
hi link xmlAttrib Statement
hi clear swiftKeywords
hi link swiftKeywords Function
hi link sqlKeyword Function
hi link sqlStatement Function

" SEARCH BEHAVIOR
set incsearch              " start searching before pressing enter
set hlsearch               " highlight search results

" TABS
set expandtab
set autoindent
set smartindent
au! FileType python setl nosmartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set listchars+=tab:⟶\ ,eol:\ 
set list
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype eruby setlocal ts=2 sw=2 expandtab


" FILETYPE-SPECIFIC
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
autocmd FileType ruby compiler ruby
" let g:jsx_ext_required = 0


" KEY MAPPINGS

" map ; to : in normal mode so I don't have to hold down shift
nmap ; :

" use , as <leader> instead of \
let mapleader = ","

" press enter in normal mode to clear search highlighting
nnoremap <cr> :noh<cr>

" shortcut to turn on paste mode
map <leader>p :setlocal paste!<cr>

" shortcut to run JSHint
map <leader>j :JSHint<cr>

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
nmap <leader>r :%s/\<<c-r><c-w>\>/

" Echo the highlight class under the cursor
map <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Reload and edit .vimrc
nmap <silent> <leader>ev :so $MYVIMRC\|:e $MYVIMRC<CR>

" remove delay when exiting insert mode
set ttimeoutlen=10
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END




" Restore screen size and position
" See: http://vim.wikia.com/wiki/Restore_screen_size_and_position
if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
      " Default size and window postion when vim instance name not found in " ~/.vimrc
      silent! execute "set columns=150 lines=50"
      silent! execute "winpos 3098 236"
      return
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif
