
"/
"/ CtrlP
"/

map <C-p> :CtrlP<cr>
nmap <C-t> :CtrlPBufTag<cr>
nmap <C-e> :CtrlPMRUFiles<cr>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|tags\|bootstrap\|tests\|vendor\|storage\|laradock\|docker\|npm-debug|build|dist'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

" I don't want to pull up these folders/files when calling CtrlP "
set wildignore+=*/vendor/**
set wildignore+=*/node_modules/**
set wildignore+=*/tags/**
set wildignore+=*/build/**
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/.git/*



"Once CtrlP is open:

"Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"Press <c-f> and <c-b> to cycle between modes.
"Press <c-d> to switch to filename only search instead of full path.
"Press <c-r> to switch to regexp mode.
"Use <c-j>, <c-k> or the arrow keys to navigate the result list.
"Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
"Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
"Use <c-y> to create a new file and its parent directories.
"Use <c-z> to mark/unmark multiple files and <c-o> to open them.
"Run :help ctrlp-mappings or submit ? in CtrlP for more mapping help.
