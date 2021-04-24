" vscode specific settings
xnoremap <silent> K :<C-u>call <SID>hover()<CR>
nnoremap <silent> K :<C-u>call VSCodeNotify('editor.action.showHover')<CR>
" This requires the keyboard-quick-fix plugin in vscode
nnoremap <silent> qf :<C-u>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>
nnoremap <silent> R :<C-u>call VSCodeNotify('editor.action.rename')<CR>
nnoremap <silent> gr :<C-u>call VSCodeNotify('editor.action.goToReferences')<CR>

nnoremap <silent> gd <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
nnoremap <silent> S <Cmd>call VSCodeNotify('editor.action.startFindReplaceAction')<CR>
nnoremap <silent> F <Cmd>call VSCodeNotify('Find')<CR>

