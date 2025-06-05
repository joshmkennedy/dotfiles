#!/usr/bin/env zsh
source ~/.zshrc # could get rid of this if put the JRI_TOKEN in here or something
projectPath="/Users/joshkennedy/projects/tempo-time-tracker"
res=$($projectPath/current-task.ts)
echo $res > /Users/joshkennedy/dotfiles/.config/sketchybar/plugins/cache/current-jira-task.txt

if [ "$res" = "No tasks" ]; then
	sketchybar --set "$NAME" drawing=off label="$res"
	
else
	trackerTime=$($projectPath/get-trackers.ts)
	sketchybar --set "$NAME" label="$trackerTime :: $res" drawing=on
fi
