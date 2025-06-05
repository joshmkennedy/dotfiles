#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Windows
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🧠

# Documentation:
# @raycast.description list windows in space

yabai -m query --windows | jq -r '.[] | "\(.app) \(.title)"'

