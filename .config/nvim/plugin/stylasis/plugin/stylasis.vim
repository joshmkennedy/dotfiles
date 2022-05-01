if exists('g:loaded_stylasis') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo
set cpo&vim

set runtimepath^=~/.config/nvim/plugin/stylasis/

command ST lua require'stylasis'.query_specificity()
let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_stylasis = 1

