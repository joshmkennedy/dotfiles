package tmuxlayout

import (
	"bytes"
	"os/exec"
	"strings"
)

type Config struct {
	Focus   int    `toml:"Focus"`
	Command string `toml:"Command"`
	Windows []Window
	Title   string
}

type Window struct {
	Name    string  `toml:"Name"`
	Panels  []Panel `toml:"Panels"`
	Command *string `toml:"Command"`
}

type Panel struct {
	Width     *float32
	Children  []Panel
	Command   *string
	Direction string
}

func runTmuxCommand(args ...string) (string,error) {
	cmd := exec.Command("tmux", args...)
	var out bytes.Buffer
	cmd.Stdout = &out
	err := cmd.Run()
    if err != nil {
        return "", err
    }
	return strings.TrimSpace(out.String()), nil
}
