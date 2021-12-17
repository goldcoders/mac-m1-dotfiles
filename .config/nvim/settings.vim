"-------------GENERAL SETTINGS--------------"
" NVIM CONFIG checkhealth
let g:loaded_python_provider=0
"let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/opt/homebrew/bin/python3"
let g:ruby_host_prog="/usr/bin/ruby"
let g:loaded_perl_provider=0
" Use this if we wanna use PYENV
let g:python_host_prog="/Users/uriah/.pyenv/shims/python"

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1


syntax on
nnoremap c "_c
set nocompatible
filetype plugin on
set ruler                       " Show the line and column numbers of the cursor.
set formatoptions+=o            " Continue comment marker in new lines.
set nowrap                      " don't wrap lines
set modeline                    " Enable modeline.
set linespace=0                 " Set line-spacing to minimum.
set relativenumber              " Set relative number as default
nmap L :let &number=1-&number<CR>  " Toggle Line Number
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set mouse=                      " Enable Mouse Options
set list
set hidden
set cmdheight=2                 " Give more space for displaying messages.
set timeout timeoutlen=1000 ttimeoutlen=10
set colorcolumn=80

" Relative or absolute number lines
function! NumberToggle()
    if(&nu == 1)
        set nu!
        set rnu
    else
        set nornu
        set nu
    endif
endfunction

nnoremap <leader>n :call NumberToggle()<CR>

if !&scrolloff
  set scrolloff=3               " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5           " Show next 5 columns while side-scrolling.
endif

set display+=lastline
set nostartofline               " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set gdefault                    " Use 'g' flag by default with :s/foo/bar/.
set magic                       " Use 'magic' patterns (extended regular expressions).
set wildmode=longest,list,full  " Enable autocompletion:
set wildmenu

"-------------FILE HISTORY--------------"
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set autowrite                   " Automatically save before :next, :make etc.
set noswapfile                  " Don't use swapfile
set nobackup            	      " Don't create annoying backup files

"-------------TABS--------------"

set smarttab
set tabstop=4                   " a tab is four spaces "
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces "
set expandtab                   " expand tabs by default (overloadable per file type later) "
set shiftwidth=4                " number of spaces to use for autoindenting "
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>' "

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" cd ~/.config/nvim/spell
" wget http://ftp.vim.org/vim/runtime/spell/pt.utf-8.spl
" set spell spelllang=pt_pt
" zg to add word to word list
" zw to reverse
" zug to remove word from word list
" z= to get list of possibilities
" set spellfile=~/.config/nvim/spellfile.add
set nospell

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  " set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  set listchars=tab:>\ ,extends:>,precedes:<,nbsp:+
endif

if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

nnoremap <F5> :UndotreeToggle<CR>
