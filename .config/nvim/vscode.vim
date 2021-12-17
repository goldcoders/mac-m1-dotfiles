" vscode specific settings
xnoremap <silent> K :<C-u>call <SID>hover()<CR>
nnoremap <silent> K :<C-u>call VSCodeNotify('editor.action.showHover')<CR>
" This requires the keyboard-quick-fix plugin in vscode
nnoremap <silent> qf :<C-u>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>
nnoremap <silent> R :<C-u>call VSCodeNotify('editor.action.rename')<CR>
nnoremap <silent> gr :<C-u>call VSCodeNotify('editor.action.goToReferences')<CR>

nnoremap <silent> gd <Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
nnoremap <silent> gD <Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>
nnoremap <silent> F <Cmd>call VSCodeNotify('Find')<CR>
imap <tab> <Cmd>call VSCodeNotify('github.copilot.autocompleteAccepted')<CR>

