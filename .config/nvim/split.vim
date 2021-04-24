"-------------Split Management--------------"
" https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
" Split Default Layout"
set splitbelow
set splitright
set fillchars+=stl:\ ,stlnc:\ "
hi VertSplit cterm=none ctermfg=red ctermbg=none

"Resizing Split"
nmap == :vertical resize +5<cr>
nmap -- :vertical resize -5<cr>
nmap =25 :vertical resize 40<cr>
nmap =50 <c-w>=
nmap =75 :vertical resize 120<cr>
"Resizing Split Horizotal
nmap -5 :res -5<cr>
nmap __ :res -5<cr>
nmap =5 :res +5<cr>
nmap ++ :res +5<cr>

" Opening splits "
nmap vsp :vsplit<cr>
nmap sp :split<cr>


" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
