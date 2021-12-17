" Buffer Management
nmap <silent> bp :bp<CR>
nmap <silent> bn :bn<CR>
nmap <silent> bl :ls<CR>
nmap <silent>bd :bp <BAR> bd #<CR> " Delete Buffer


" Delete All Buffers Except the Current One Being Edit
nnoremap <silent>bq :w <bar> %bd <bar> e# <bar> bd# <CR>
" map :q to byffer delete
" http://stackoverflow.com/questions/7513380/vim-change-x-function-to-delete-buffer-instead-of-save-quit
cnoreabbrev <expr> q getcmdtype() == ":" && (getcmdline() == 'q' && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1) ? 'bd' : 'q'
