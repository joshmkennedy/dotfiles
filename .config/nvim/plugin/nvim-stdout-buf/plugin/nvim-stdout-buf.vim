" Put description here!!!
" Last Change:  2021 Aug 12
" Maintainer:   Josh
" License:      GNU General Public License v3.0

if exists('g:loaded_stdout_buf') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo
set cpo&vim

"hi def link WhidHeader      Number
"hi def link WhidSubHeader   Identifier
" hi WhidCursorLine ctermbg=238 cterm=none

command!StdoutBuf lua require'stdout_buf'.stdout_buf()
command! StdoutClose lua require'stdout_buf'.close_todo_panel()


let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_stdout_buf = 1
