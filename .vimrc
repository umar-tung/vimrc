syntax on

set termguicolors
set guicursor=
set relativenumber
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" basic Plugin Manager commands
"
" basic coc commands:
"   :PlugInstall <pluginName> - Install plugins
"   :PlugUpdate <pluginName> - Update or install plugins
"   :PlugClean - Removes unlisted plugins
" 

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gruvbox-community/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jmcantrell/vim-virtualenv'
Plug 'airblade/vim-rooter'

call plug#end()

if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark
let g:airline_theme='wombat'

" CoC settings
"
" basic coc commands:
"   :CocInstall <server>
"   :CocList extensions - shows all the extensions that ARE downloaded
"   :CocList marketplace - shows all extensions that can be downloaded
"   :CocUninstall <server> - uninstalls the language server
" 
" List of Coc extensions
" Extensions to consider:
" coc-fzf-preview
let g:coc_global_extensions = [
      \'coc-marketplace',
      \'coc-tsserver',
      \'coc-pyright',
      \'coc-html',
      \'coc-css',
      \'coc-clangd',
      \'coc-tailwindcss',
      \]

set hidden
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

let mapleader = " "

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:netrw_browse_split=2
let g:netre_banner = 0
let g:netrw_winsize=25

let g:ctrlp_use_caching = 0

nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <leader>ut :UndotreeShow<CR>
nnoremap <leader>ft :NERDTree % <bar> :vertical resize 30<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <silent> + :vertical resize +5<CR>
nnoremap <silent> _ :vertical resize -5<CR>
nmap <leader>F :FZF<CR>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>do <Plug>(coc-codeaction)


nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>cr :CocRestart

