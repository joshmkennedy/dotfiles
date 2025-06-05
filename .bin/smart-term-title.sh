DISABLE_AUTO_TITLE="true"

function set_title() {
  local title="$1"
  local seq="\033]0;${title}\007"

  if [[ -n "$TMUX" ]]; then
    # Wrap for tmux passthrough
    print -n -- "\033Ptmux;\033${seq}\033\\"
  else
    # Plain terminal
    print -n -- "$seq"
  fi
}

# Get the path relative to nearest git root (or fallback to $PWD)
function rel_to_git_root() {
  if git rev-parse --show-toplevel &>/dev/null; then
    local git_root=$(git rev-parse --show-toplevel)
    echo "${PWD/#$git_root\//}"
  else
    echo "$PWD"
  fi
}

function precmd() {
  if [[ -z "$TMUX" ]]; then
    set_title "👻"
    return
  fi

  local session_name=$(tmux display-message -p '#S' 2>/dev/null)
  local pane_title=$(tmux display-message -p '#T' 2>/dev/null)

  if [[ "$pane_title" == "zsh" ]]; then
    local rel_path=$(rel_to_git_root)
    set_title "$session_name | $rel_path"
  else
    set_title "$session_name | $pane_title"
  fi
}

function preexec() {
  # Optionally: show command temporarily while running
  # Uncomment if you want command preview in title while it runs
  # local rel_path=$(rel_to_git_root)
  # set_title "🛠 $rel_path $1"
}
