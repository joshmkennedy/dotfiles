#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Git Next Tag
# @raycast.mode inline
# @raycast.refreshTime 1h

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description copies the project directories next tag to clipboard

cd $(tmux display-message -p "#{pane_current_path}")

tag=$(~/bin/git-next-tag patch)
echo $tag | pbcopy
echo "Copied tag $tag to clipboard"

