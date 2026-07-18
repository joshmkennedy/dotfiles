# Keep Ghostty's idea of the terminal working directory in sync while zsh is
# running inside tmux. Ghostty's automatic shell integration is installed only
# in the shell it launches directly, so the zsh processes tmux starts need to
# report their cwd through tmux's passthrough escape sequence.

if [[ -n ${TMUX:-} && ( ${TERM_PROGRAM:-} == ghostty || -n ${GHOSTTY_RESOURCES_DIR:-} ) ]]; then
  autoload -Uz add-zsh-hook

  _ghostty_tmux_report_pwd() {
    local tmux_binary=${commands[tmux]:-/opt/homebrew/bin/tmux}
    local pane_state pane_active window_active session_attached

    # allow-passthrough is intentionally set to "all" in this tmux config.
    # Without this visibility check, a prompt drawn in a hidden window could
    # replace the cwd for the Ghostty surface the user is actually viewing.
    pane_state=$($tmux_binary display-message -p -t "$TMUX_PANE" \
      '#{pane_active}|#{window_active}|#{session_attached}' 2>/dev/null) || return
    IFS='|' read -r pane_active window_active session_attached <<< "$pane_state"
    (( pane_active && window_active && session_attached )) || return

    print -n -- $'\ePtmux;\e\e]7;kitty-shell-cwd://'"${HOST}${PWD}"$'\a\e\\'
  }

  add-zsh-hook -d precmd _ghostty_tmux_report_pwd 2>/dev/null || true
  add-zsh-hook precmd _ghostty_tmux_report_pwd
  add-zsh-hook -d chpwd _ghostty_tmux_report_pwd 2>/dev/null || true
  add-zsh-hook chpwd _ghostty_tmux_report_pwd

  _ghostty_tmux_report_pwd
fi
