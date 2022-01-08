let g:todo =  system("todo\ vStatusline | tr -d '\n'")
func! Get_Current_Todo() 
		return g:todo 
endfunc	

func! Update_Current_Todo()
 let g:todo =	system("todo\ vStatusline | tr -d '\n'")
endfunc

autocmd BufReadPre,FileReadPre * call Update_Current_Todo()
set statusline=
"set statusline+=%#WildMenu#
set statusline+=%h%m%t
"set statusline+=\ %#DraculaTodo#
set statusline+=\ \|\ \%{Get_Current_Todo()}\ \ 
"set statusline+=%#QuickFixLine#
set statusline+=%h%r%=%-14.(%l,%c%V%)\ %P









