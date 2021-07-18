" {{{ tmux and vim-slime configuration
" Free my prefix key
" map ` <Nop>

" if exists('$TMUX')
"   " Execute previous command in the last active pane
"   nnoremap <silent> <leader><tab> :silent !tmux send-keys -t \! Up Enter<cr>
"   nnoremap <silent> <leader><leader><tab> :silent !tmux clear-history -t right && tmux send-keys -t \! C-l Up Enter<cr>
" endif

" " slime
let g:slime_target = "tmux"
" let g:slime_paste_file = "$HOME/.slime_paste"
" let g:slime_paste_file = tempname()
let g:slime_default_config = {"socket_name": "default", "target_pane": "0.1"}
" let g:slime_dont_ask_default = 1
" let g:slime_no_mappings = 1

" " Configure slime for the right tmux pane in the current window
" function! s:JbzSlimeRight()
"   if !exists('$TMUX')
"     echo "tmux is not running"
"     return
"   endif
"   let win_num = split(system("tmux display-message -p '#I'"), "\n")[0]
"   let sock = split($TMUX, ",")[0]
"   let b:slime_config = {"socket_name": sock, "target_pane": win_num . '.2' }
"   call slime#config()
" endfunction
" command! JbzSlimeRight call s:JbzSlimeRight()

" " Open tmux pane with selected REPL and run slime configuration routine
" function! s:JbzOpenSlimeREPL(repl_exe, ...)
"   if !exists('$TMUX')
"     echo "tmux is not running"
"     return
"   endif

"   let cmd = a:repl_exe

"   " Parse additional command to execute before running the REPL
"   let cmd_aux = get(a:, 1, "")
"   if !empty(cmd_aux) | let cmd = cmd_aux . " && " . cmd | endif

"   call system("tmux split-window -h \"" . cmd . "\"")
"   call system("tmux last-pane")
"   echoerr "cmd=" . cmd
"   call s:JbzSlimeRight()
" endfunction
" command! -nargs=+ JbzOpenSlimeREPL call s:JbzOpenSlimeREPL(<f-args>)

" nnoremap <leader>sc :JbzSlimeRight
" xmap <leader>ss <Plug>SlimeRegionSend
" nmap <leader>ss <Plug>SlimeParagraphSend
" nmap <leader>sl <Plug>SlimeSendCurrentLine
" }}}
