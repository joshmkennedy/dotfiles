#!/usr/bin/env sh

cache="$HOME/dotfiles/.cache/term-title"
# cache="/tmp/term-title.fifo"
mkdir -p "$(dirname "$cache")"

# Get pane info
# pane_pid=$(tmux display-message -p "#{pane_pid}")
pwd=$(tmux display -p -F "#{pane_current_path}")
dir=$(basename "$pwd")
session=$(tmux display -p "#S")
cmd=$(tmux display -p "#{pane_current_command}")

# Format similar to preexec logic
if [ "$cmd" = "zsh" ]; then
  echo "$pwd" > "$cache"
elif [ "$cmd" = "nvim" ]; then
	if [ "$session" = "$dir" ]; then
		echo "$session" > "$cache"
	else
	# Fallback to session and dir if no child process found
		echo "$session | $dir" > "$cache"
	fi
else
	echo "$session | $cmd" > "$cache"
fi
