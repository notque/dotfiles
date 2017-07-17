runtime macros/matchit.vim
runtime bundle/vim-pathogen/autoload/pathogen.vim

"vim needs a posix compliant shell
if &shell =~# 'fish$'
  set shell=/bin/sh
endif

execute pathogen#infect()

filetype plugin indent on

set runtimepath^=~/.vim/bundle/ctrlp.vim

"gets rid of all the crap that Vim does to be vi compatible
set nocompatible

"prevents some security exploits having to do with modelines
set modelines=0

"tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"a few options that just make things better
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set nofoldenable
set foldmethod=manual
set clipboard=unnamed

" Disable swapfile and backup {{{2
set nobackup
set noswapfile

"change leader away from \
let mapleader = ","

"a few options that just make things better
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"makes Vim handle long lines correctly
set wrap
set textwidth=79
set formatoptions=qrn1
if exists('+colorcolumn')
  set colorcolumn=85
endif

"force arrow keys off
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"Use the arrows to something usefull
map <right> :BF<CR>
map <left> :BB<CR>
map <up> :BD<CR>

"get rid of that stupid goddamned help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"save on losing focus
au FocusLost * :wa

"Color scheme (terminal)
syntax on
let g:solarized_contrast = 'high'
let g:solarized_visibility = 'low'
let g:solarized_termtrans = 1
set fillchars=vert:│
" Override color scheme to make split the same color as tmux's default
autocmd ColorScheme * highlight VertSplit cterm=NONE guibg=NONE ctermbg=NONE
set guifont=Hack:h12
colorscheme solarized

"Gui Options
set guioptions=e-t

"Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"NERDTree Helpers
nmap <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['tmp', 'pkg$']

"Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

"Tabularize helpers
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>

"Retab shortcut
nmap <Leader>retab :%retab<CR>

" hard wrap
nnoremap Q gqip 

"Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Ruby support
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

"JSON support
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd FileType json set equalprg=json_reformat
  
"Powerline
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'

"vim-markdown
let g:vim_markdown_folding_disabled=1

"ctrl-p
let g:ctrlp_custom_ignore = 'vendor/bundle'

"fugitive
let g:fugitive_github_domains = ['github.com', 'github.wdf.sap.corp']

"Enable goimports to automatically insert import paths instead of gofm
let g:go_fmt_command = "goimports"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>e <Plug>(go-rename)


"Neocomplete
let g:neocomplete#enable_at_startup = 1
set completeopt-=preview

"Supertab
let g:SuperTabDefaultCompletionType = "context"

"tagbar
nmap <Leader>tb :TagbarToggle<CR>

" Presentation colors and config
function! PresentationMode()
	set background=light
	colorscheme solarized
	set nolist
  set laststatus=0
  set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h12
endfunction
nmap <leader>PR :call PresentationMode()<cr>
