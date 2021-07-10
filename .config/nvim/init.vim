" Init Config and Install Plugin for the first time
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
    autocmd VimEnter * :PlugInstall
endif

" Load Plugins with vim-plug
call plug#begin('~/.config/nvim/plugged')

" Shared plugins with VSCode
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/nerdcommenter'

" Global Shared Settings
set clipboard=unnamedplus       " Use the Global Clipboard with Vim

if exists('g:vscode')
  source ~/.config/nvim/vscode.vim
else
  " Colorscheme
  Plug 'morhetz/gruvbox'
  Plug 'easymotion/vim-easymotion'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'terryma/vim-multiple-cursors'
  " Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'tpope/vim-vinegar'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " General
  Plug 'airblade/vim-gitgutter'
  Plug 'prettier/vim-prettier', {
        \ 'do': 'yarn install',
        \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  " Dart
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'natebosch/vim-lsc'
  Plug 'natebosch/vim-lsc-dart'

  Plug 'tpope/vim-fugitive'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jiangmiao/auto-pairs'

    " Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'natebosch/dartlang-snippets'
  " Make sure to load this plugin last
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/goyo.vim'
  Plug 'mbbill/undotree'
endif

call plug#end()

if !exists('g:vscode')
" Source vim files
  source ~/.config/nvim/settings.vim
  source ~/.config/nvim/split.vim
  source ~/.config/nvim/theme.vim
  source ~/.config/nvim/mappings.vim
  source ~/.config/nvim/auto_command.vim
  source ~/.config/nvim/buffer.vim
  source ~/.config/nvim/tab.vim
  source ~/.config/nvim/move-line.vim
  source ~/.config/nvim/flutter.vim
  source ~/.config/nvim/quickfixlist.vim
endif
