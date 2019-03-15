call  plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'morhetz/gruvbox'
Plug 'Raimondi/delimitMate'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --ts-completer' }
Plug 'easymotion/vim-easymotion'
Plug 'turbio/bracey.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'kien/rainbow_parentheses.vim'
Plug 'romainl/vim-cool'

call plug#end()

" Basics
    set nocompatible
    filetype plugin on
    set modelines=0
    set encoding=utf-8
    set noswapfile
    set nobackup
    set ignorecase
    set smartcase
    set incsearch
    set smartindent
    set wrap
    set nu rnu
    set cursorline

    " tabs set to 4 spaces and 2 spaces with html
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set showcmd

    autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2

    " system clipboard access
    set clipboard=unnamedplus

" Set colorscheme
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    syntax enable
    let g:gruvbox_italic=1
    colorscheme gruvbox

" Autocompletion
    set wildmode=longest,list,full

" Open split at the bottom and right
    set splitbelow splitright

" Highlighy last column
    set colorcolumn=110

" Spit navigation
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" Tabs mapping
    nmap <Tab> :tabnext<CR>
    nmap <S-Tab> :tabprevious<CR>
    " That is <Alt> + <Tab>
    nmap <M-Tab> :tabnew<CR>;

" Save and close tab mapping
    nmap <F9> :w<CR>
    nmap q :q<CR>

" Delete trailing whitespaces on save
    autocmd BufWritePre * %s/\s\+$//e

" Make mapping
    nnoremap <F4> :make!<CR>

" Plus buffer mapping
    vnoremap <C-c> "+y
    map <C-p> "+P

" leader mapping
    map <leader> ,

" vim-easy-align plugin
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

" goyo plugin
    nmap gy :Goyo<CR>

" emmet-vim plugin
    let g:user_emmet_leader_key='<C-Z>'

" fzf plugin
    map ; :Files<CR>

" lightline plugin
    set laststatus=2
    set noshowmode
    let g:lightline = { 'colorscheme': 'gruvbox' }

" nerdtree plugin
    map <C-o> :NERDTreeToggle<CR>

" ycm plugin
    let g:ycm_confirm_extra_conf = 0

" ultisnips plugin
    let g:UltiSnipsExpandTrigger="<C-X>"

" vim-easymotion
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_smartcase = 1

    nmap s <Plug>(easymotion-overwin-f)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)

" vim-jsx
    let g:jsx_ext_required = 0 " Allow JSX in ordinary JS files

" indentLine
    let g:indentLine_char = '▏'

" rainbow_parentheses
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
