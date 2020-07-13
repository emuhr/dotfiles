syntax on              " enable syntax highlighting
set cursorline          " highlight the current line
set nobackup            " don't create pointless backup files; Use VCS instead
set autoread            " watch for file changes
set number relativenumber  " show relative line numbers
set showcmd             " show selection metadata
set showmode            " show INSERT, VISUAL, etc. mode
set showmatch           " show matching brackets
set autoindent smartindent  " auto/smart indent
set smarttab            " better backspace and tab functionality
set scrolloff=5         " show at least 5 lines above/below
filetype on             " enable filetype detection
filetype indent on      " enable filetype-specific indenting
filetype plugin on      " enable filetype-specific plugins

" column-width visual indication
"let &colorcolumn=join(range(81,999),",")
"highlight ColorColumn ctermbg=235 guibg=#001D2F

" tabs and indenting
set autoindent          " auto indenting
set smartindent         " smart indenting
set expandtab           " spaces instead of tabs
set tabstop=2           " 2 spaces for tabs
set shiftwidth=2        " 2 spaces for indentation

" bells
set noerrorbells        " turn off audio bell
set visualbell          " but leave on a visual bell

" search
set hlsearch            " highlighted search results
set showmatch           " show matching bracket

" other
set guioptions=aAace    " don't show scrollbar in MacVim
" call pathogen#infect()  " use pathogen


"
" vim-plug start
" 
" Auto installation of vim-plugged
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'junegunn/vim-easy-align'
Plug 'rustushki/JavaImp.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tidalcycles/vim-tidal'
Plug 'tpope/vim-surround'
Plug 'aklt/plantuml-syntax'
Plug 'supercollider/scvim'
Plug 'davidgranstrom/scnvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'l04m33/vlime', {'rtp': 'vim/'}
"Plug 'liuchengxu/vim-clap', { 'do': function('clap#helper#build_all') }
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Initialize plugin system
call plug#end()
"
" vim-plug end
"
"

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"  Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" ayu theme
set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" deoplete
"let g:deoplete#enable_at_startup = 1

" scvim configuration
let g:sclangTerm = "kitty"

"scnvim
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'scnvim-data']
