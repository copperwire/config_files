call plug#begin('~/.config/nvim/plugged')

Plug 'ervandew/supertab'
"filetree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"context code highlight
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"colorscheme
Plug 'https://github.com/morhetz/gruvbox'
" better scrolling C-d
Plug 'Kazark/vim-SimpleSmoothScroll'
" linting
Plug 'w0rp/ale'

Plug 'mileszs/ack.vim'
"status var
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" better merge tools :Gdiff
Plug 'tpope/vim-fugitive'
"easy modify of surround
Plug 'tpope/vim-surround'

Plug 'mileszs/ack.vim'

Plug 'mhinz/vim-signify'
" shows marks in margin
Plug 'kshenoy/vim-signature'
" fast movement by s{char}{char}
Plug 'justinmk/vim-sneak'
"icons for nerdtree etc.
Plug 'https://github.com/ryanoasis/vim-devicons'
call plug#end()

inoremap jj <Esc>

colorscheme gruvbox

set background:dark
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

let g:sneak#label=1

map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

set number        " always show line numbers
set relativenumber

set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change he terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

autocmd BufEnter * silent! lcd %:p:h " moving directory for each buffer opened

" remap leader key
let mapleader = ','

" displaying indent 
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

let g:python3_host_prog = '/usr/local/bin/python3'

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"incsearch toggle 
set incsearch

" remap exiting terminal mode
tnoremap jj <C-\><C-n>

let g:airline_powerline_symbols = 1 
let g:airline_theme = 'gruvbox'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let g:ale_fixers = {'python': 'autopep8'}

" execute python script
nnoremap <F8> :te python3 % <CR>

" coc config 
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
