#!/usr/bin/env zsh

label=$(sketchybar --query "$NAME" | jq '.label.value'| sed 's/^"\(.*\)|.*$/\1/')

echo $label | pbcopy
