" Init Config and Install Plugin for the first time
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
    autocmd VimEnter * :PlugInstall
endif

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" Load Plugins with vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround', Cond(!exists('g:vscode'))
Plug 'terryma/vim-multiple-cursors', Cond(!exists('g:vscode'))
Plug 'preservim/nerdcommenter', Cond(!exists('g:vscode'))
Plug 'vim-test/vim-test', Cond(!exists('g:vscode'))
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
" Shared plugins with VSCode
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
"Plug 'morhetz/gruvbox', Cond(!exists('g:vscode'))
Plug 'vim-airline/vim-airline', Cond(!exists('g:vscode'))
Plug 'vim-airline/vim-airline-themes', Cond(!exists('g:vscode'))
Plug 'terryma/vim-multiple-cursors', Cond(!exists('g:vscode'))
Plug 'tpope/vim-vinegar', Cond(!exists('g:vscode'))
Plug 'ctrlpvim/ctrlp.vim', Cond(!exists('g:vscode'))
Plug 'Xuyuanp/nerdtree-git-plugin', Cond(!exists('g:vscode'))
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', Cond(!exists('g:vscode'))
" Git
Plug 'airblade/vim-gitgutter', Cond(!exists('g:vscode'))
" Dart
Plug 'dart-lang/dart-vim-plugin', Cond(!exists('g:vscode'))
Plug 'natebosch/vim-lsc', Cond(!exists('g:vscode'))
Plug 'natebosch/vim-lsc-dart', Cond(!exists('g:vscode'))
" Add Some Useful Flutter Commands
Plug 'thosakwe/vim-flutter', Cond(!exists('g:vscode'))
Plug 'tpope/vim-fugitive', Cond(!exists('g:vscode'))
Plug 'jiangmiao/auto-pairs', Cond(!exists('g:vscode'))
  " Snippets
Plug 'SirVer/ultisnips', Cond(!exists('g:vscode'))
Plug 'honza/vim-snippets', Cond(!exists('g:vscode'))
Plug 'natebosch/dartlang-snippets', Cond(!exists('g:vscode'))
Plug 'prettier/vim-prettier', Cond(!exists('g:vscode'), { 'do': 'yarn install','for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] })
Plug 'iamcco/markdown-preview.nvim', Cond(!exists('g:vscode'), { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']})
Plug 'neoclide/coc.nvim',Cond(!exists('g:vscode'), {'branch': 'release'})
Plug 'scrooloose/nerdtree',Cond(!exists('g:vscode'), { 'on': ['NERDTreeToggle', 'NERDTreeFind'] })
" Make sure to load this plugin last
Plug 'ryanoasis/vim-devicons', Cond(!exists('g:vscode'))
Plug 'junegunn/goyo.vim', Cond(!exists('g:vscode'))
Plug 'mbbill/undotree', Cond(!exists('g:vscode'))
call plug#end()

" Shared Nvim and VSCODE Keymaps
let mapleader = ' '
" Use System clipboard
set clipboard=unnamedplus       " Use the Global Clipboard with Vim

" yank till end of line
noremap Y y$<cr>

"-------------SEARCH--------------"
highlight Search cterm=underline
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters

nnorema ,<leader> :set hlsearch!<CR>

" For Dart Testing
nnoremap <space>r :TestNearest<cr>
nnoremap <space>f :TestFile<cr>
nnoremap <space>s :TestSuite<cr>

" Enable Default Easymotion KeyMap for both VSCode and Nvim
let g:EasyMotion_do_mapping = 1

"nmap <silent> t<C-l> :TestLast<CR>
"nmap <silent> t<C-g> :TestVisit<CR>

" Source Neovim Bindings
if exists('g:vscode')
  source ~/.config/nvim/vscode.vim
endif

" Source Vim Bindings
if !exists('g:vscode')
" Source vim files
  source ~/.config/nvim/settings.vim
  source ~/.config/nvim/split.vim
  "source ~/.config/nvim/theme.vim
  source ~/.config/nvim/mappings.vim
  source ~/.config/nvim/auto_command.vim
  source ~/.config/nvim/buffer.vim
  source ~/.config/nvim/tab.vim
  source ~/.config/nvim/move-line.vim
  source ~/.config/nvim/flutter.vim
  source ~/.config/nvim/quickfixlist.vim
endif
