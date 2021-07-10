nnoremap <leader>q :call ToggleQFList(0)<CR>

let g:quick_fix_list_global = 0
let g:quick_fix_list_local = 0

fun! ToggleQFList(global)
    if a:global
        if g:quick_fix_list_global == 1
            let g:quick_fix_list_global = 0
            cclose
        else
            let g:quick_fix_list_global = 1
            copen
        end
    else
        if g:quick_fix_list_local == 1
            let g:quick_fix_list_local = 0
            lclose
        else
            let g:quick_fix_list_local = 1
            lopen
        end
    endif
endfun