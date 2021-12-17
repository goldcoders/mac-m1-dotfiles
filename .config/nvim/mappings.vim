let maplocalleader = '\'

nnoremap <F3> :set hlsearch!<CR>
" Prevent CTRL+Z suspending Vim
nnoremap <c-z> <nop>

" Search and Replace
nnoremap S :%s//g<Left><Left>

" set cursor column
vmap <BS> x

"Pasting large amounts of text into Vim "
set pastetoggle=<F2>


" Save File
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Undo Redo Remap
nnoremap <C-Z> u
nnoremap <C-Y> <C-R>

" ctrl hjkl as arrow key
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" reload vim config
nnoremap  <leader><CR> :source $MYVIMRC <cr>

nnoremap <silent> Q <nop>

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

if has_key(plugs, 'vim-prettier')
    source ~/.config/nvim/plugins/vim-fugitive.vim
endif

if has_key(plugs, 'coc.nvim')
    source ~/.config/nvim/plugins/coc.vim
endif

if has_key(plugs, 'coc.nvim')
    source ~/.config/nvim/plugins/coc.vim
endif

if has_key(plugs, 'goyo.vim')
    source ~/.config/nvim/plugins/goyo.vim
endif

if has_key(plugs, 'ultisnips')
    source ~/.config/nvim/plugins/ultisnips.vim
endif

if has_key(plugs, 'vim-flutter')
    source ~/.config/nvim/plugins/vim-flutter.vim
endif


"source ~/.config/nvim/plug/vimwiki.vim
"source ~/.config/nvim/plug/grammarous.vim
"source ~/.config/nvim/plug/treesitter.vim
