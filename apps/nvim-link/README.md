# Nvim Link

`Nvim Link.app` is a tiny macOS document handler for Ghostty's clickable file
paths. It invokes `~/.bin/tmux-nvim-open`, which finds an `nvim` process in
the most recently active tmux client session and sends it a safe `:edit`
command, then switches that client to the editor window. If no nvim pane
exists, it creates a new `nvim` tmux window.
After either handoff, it activates Ghostty so a Finder-opened file leaves the
editor, rather than Finder, as the focused application.

Build and register it with:

```sh
brew install duti
~/.bin/install-nvim-link
```

The installer deliberately associates only developer text types (source code,
scripts, JSON, XML, YAML, and Markdown). It does not claim arbitrary files.
macOS identifies TypeScript's `.ts` extension as an MPEG transport stream, so
the installer deliberately assigns that UTI to Nvim Link as well.
It also exports narrow UTIs for `.tsx`, `.toml`, `.conf`, and `.ini`.

In Ghostty inside tmux, use Command-Shift-Click on a detected path. Shift
bypasses tmux mouse capture so Ghostty receives the click.

Relative paths (for example, Vitest output) require Ghostty to know the cwd of
the tmux pane. `~/.zshrc` sources `~/.bin/ghostty-tmux-cwd.zsh`, which reports
the active pane's cwd at each prompt and after `cd`. The report uses tmux
passthrough and ignores hidden panes so background shells cannot replace the
visible surface's cwd.

## Prototype constraints

macOS launches document handlers without a `TMUX` environment. The opener
therefore uses the most recently active tmux client as the current session.
That is correct for one active tmux client; with multiple simultaneously used
clients, the last-focused client wins. If several `nvim` panes exist in that
session, the first in tmux window/pane order is selected.

When no tmux client exists, `tmux-nvim-open` starts a new Ghostty instance.
It runs `tmux-nvim-bootstrap`, which creates or reattaches the `nvim-link`
session, opens the file there, and attaches the new terminal to that session.
