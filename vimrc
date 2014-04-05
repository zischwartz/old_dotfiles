call pathogen#infect()
syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly


nmap \l :setlocal number!<CR>:setlocal number?<CR>
nmap \o :set paste!<CR>
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/venv/*

nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>


set laststatus=2
command! Q q
command! W w
