package tmuxlayout

import (
	"bufio"
	"bytes"
	"fmt"
	"os"
	"os/exec"
	"strings"

	"github.com/BurntSushi/toml"
)

func SaveTmuxLayout() {
	session, err := runTmuxCommand("display-message", "-p", "#{session_name}")
	if err != nil {
		fmt.Println("couldn't get session name")
		panic(err)
	}

	// Parse all windows
	listWindows, err := runTmuxCommand("list-windows", "-F", "#{window_index} #{window_name}")
	if err != nil {
		fmt.Println("could not get window list")
		panic(err)
	}
	windowLines := strings.Split(listWindows, "\n")

	var windows []Window

	for _, line := range windowLines {
		// Only put panels if there's more than 1 (single pane is handled via Command field)
		var windowCmd *string
		var windowLoc *string

		parts := strings.SplitN(line, " ", 2)
		index, name := parts[0], parts[1]

		listPanes, err := runTmuxCommand("list-panes", "-t", fmt.Sprintf("%s:%s", session, index),
			"-F", "#{pane_index} #{pane_pid} #{pane_current_path}")
		if err != nil {
			fmt.Println("could not get pane list")
			panic(err)
		}
		paneLines := strings.Split(listPanes, "\n")

		var panels []Panel

		for panelIdx, p := range paneLines {
			parts := strings.SplitN(p, " ", 4)

			pid := parts[1]
			command := ""

			var processCommand string
			processCommand, err = getFullCommandByPanePID(pid)
			if err != nil {
				processCommand = ""
			}
			if strings.Contains(processCommand, "zsh") {
				processCommand = ""
			}

			loc := parts[2]
			if panelIdx == 0 {
				windowLoc = &loc
				command = fmt.Sprintf("cd %s;\n %s\n", loc, processCommand)
				windowCmd = &command
			} else {
				// ensure we save the cwd of each panel
				if loc != *windowLoc {
					command = fmt.Sprintf("cd %s;\n %s\n", loc, processCommand)
				} else {
					if processCommand != "" {
						command = fmt.Sprintf("%s;\n", processCommand)
					}
				}
				panel := Panel{
					Command:   &command,
					Direction: "h",
				}
				panels = append(panels, panel)
			}
		}

		windows = append(windows, Window{
			Name:    name,
			Panels:  panels,
			Command: windowCmd,
		})
	}

    root := windows[0]
	windows[0].Command = nil

	cfg := Config{
		Title:   session,
		Focus:   1,
		Windows: windows[1:],
		Command: *root.Command,
	}

	buf := new(bytes.Buffer)
	err = toml.NewEncoder(buf).Encode(cfg)
	if err != nil {
		panic(err)
	}

	layoutFile := ".tmux-layout"
	err = os.WriteFile(layoutFile, buf.Bytes(), 0644)
	if err != nil {
		panic(err)
	}

	fmt.Printf("Layout saved to %s\n", layoutFile)

}

func getFullCommandByPanePID(panePID string) (string, error) {
	cmd := exec.Command("ps", "-ao", "ppid,args")
	out, err := cmd.Output()
	if err != nil {
		return "", fmt.Errorf("could not get command for pane (125): %w", err)
	}

	scanner := bufio.NewScanner(bytes.NewReader(out))
	for scanner.Scan() {
		line := strings.TrimSpace(scanner.Text())
		fields := strings.Fields(line)

		if len(fields) < 2 {
			continue
		}
		if fields[0] == panePID {
			return strings.Join(fields[1:], " "), nil
		}
	}

	return "", fmt.Errorf("no matching command found for pane PID %s", panePID)
}

func dd(v any) {
	fmt.Printf("%+v\n", v)
	panic("stopped")
}
