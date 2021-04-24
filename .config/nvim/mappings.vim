let mapleader = ' '
let maplocalleader = '\'

" Prevent CTRL+Z suspending Vim
nnoremap <c-z> <nop>

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" set cursorcolumn
nmap <Space> <PageDown>
vmap <BS> x

"Pasting large amounts of text into Vim "
set pastetoggle=<F2>

nnoremap <F3> :set hlsearch!<CR>
nnoremap ,<leader> :set nohlsearch<CR>


" Check when plugins Loaded then load their specific key bindings
if has_key(plugs, 'nerdtree')
    source ~/.config/nvim/plugins/nerdtree.vim
endif

if has_key(plugs, 'ctrlp.vim')
    source ~/.config/nvim/plugins/controlP.vim
endif

if has_key(plugs, 'vim-gitgutter')
    source ~/.config/nvim/plugins/git-gutter.vim
endif

if has_key(plugs, 'markdown-preview.nvim')
    source ~/.config/nvim/plugins/markdown-preview.vim
endif


if has_key(plugs, 'vim-airline')
    source ~/.config/nvim/plugins/vim-airline.vim
endif


if has_key(plugs, 'nerdcommenter')
    source ~/.config/nvim/plugins/nerdcommenter.vim
endif


if has_key(plugs, 'vim-multiple-cursors')
    source ~/.config/nvim/plugins/multicursors.vim
endif


if has_key(plugs, 'vim-easymotion')
    source ~/.config/nvim/plugins/easymotion.vim
endif


if has_key(plugs, 'vim-prettier')
    source ~/.config/nvim/plugins/prettier.vim
endif



"source ~/.config/nvim/plug/vimwiki.vim
"source ~/.config/nvim/plug/grammarous.vim
"source ~/.config/nvim/plug/treesitter.vim
