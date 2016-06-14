call plug#begin('~/.nvim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'bling/vim-airline'
  Plug 'godlygeek/tabular'
  Plug 'garbas/vim-snipmate'
  Plug 'janko-m/vim-test'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' } " Plugin outside ~/.vim/plugged with post-update hook
  Plug 'https://github.com/junegunn/vim-github-dashboard.git' " Using git URL
  Plug 'kien/ctrlp.vim'
  Plug 'mileszs/ack.vim'
  Plug 'scrooloose/syntastic'
  Plug 'scrooloose/nerdtree'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sensible'
  Plug 'vim-scripts/HTML-AutoCloseTag'
  Plug 'sheerun/vim-polyglot' " SYNTAX HIGHLIGHTS
call plug#end()

" VIM-AIRLINE SMARTER TAB LINE
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline_theme='dark'
let g:airline_powerline_fonts=1

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" SYNTASTIC
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" NETRW commented out to use nerdtree
" let g:netrw_liststyle=3
" let g:netrw_winsize=85
" let g:netrw_banner=0
" let g:netrw_browse_split=4

" SILVER SEARCHER
let g:ackprg = 'ag --nogroup --nocolor --column'

" VIM-MULTIPLE-CURSORS
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_quit_key='<Esc>'

" GIT-GUTTER
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" NERDtree
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

" COLORS
set colorcolumn=81
set background=dark
let g:solarized_termcolors=16
let g:solarized_termtrans=1
colorscheme solarized

" ------------------------------------------------------------------------------------
"                                  MORE CONFIG!
" ------------------------------------------------------------------------------------
set tabstop=2     " Size of a hard tabstop
set shiftwidth=2  " Size of an 'indent'
                  " a combination of spaces and tabs are used to simulate tab stops at a width
                  " other than the (hard)tabstop
set softtabstop=2
set smarttab      " Make 'tab' insert indents instead of tabs at the beginning of a line
set expandtab     " always use spaces instead of tab characters
set splitright    " v split
set number        " line numbers
set autoread      " auto refresh
set hid           " a buffer becomes hidden when it is abandoned
set noswapfile    " take out swap files
set cursorline!   " see where the cursor is easier
set nopaste       " get that annoying paste out
" set nohls         " don't highlight everything

" ------------------------------------------------------------------------------------
"                                  KEY BINDINGS
" ------------------------------------------------------------------------------------
let mapleader=" "

" SPLITS
nmap <silent> <leader>W :split<CR>
nmap <silent> <leader>w :vsplit<CR>

" TEST SUITES
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>

" WINDOW RESIZE
nnoremap <A-H> :vertical resize +10<CR>
nnoremap <A-L> :vertical resize -10<CR>
nnoremap <A-K> :resize -5<CR>
nnoremap <A-J> :resize +5<CR>

" TABS
nmap <C-T> :tabe<CR>
" map <leader>h :tabn<CR>
" map <leader>l :tabp<CR>

" COPY AND PASTE LINES
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" YANK TO CLIPBOARD
imap <C-V> <Esc>"+gPi
vmap <C-C> "+y

imap qq <ESC>

" NERDTree
nnoremap <silent> <leader>\ :NERDTreeToggle<CR>

" ------------------------------------------------------------------------------------
"                                  FUNCTIONS
" ------------------------------------------------------------------------------------
" Show trailing whitespace only after some text (ignores blank lines):
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Auto trim white space
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
