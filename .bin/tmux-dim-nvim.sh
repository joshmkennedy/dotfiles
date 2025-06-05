#! /usr/bin/env bash
prev_pane=$(cat ~/dotfiles/.cache/.tmux-last-pane)
prev_pid=$(tmux display-message -p -t $prev_pane -F "#{pane_pid}")
cmd=$(ps -ao "ppid,args" -o command= | grep $prev_pid) 
echo $cmd | grep -q " nvim " && \
	echo "left nvim" >> ~/dotfiles/tmp/tmux-dim-nvim.log


