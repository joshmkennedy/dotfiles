package main

import (
	"fmt"
	"os/exec"
)

type Config struct {
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

func TmuxLayout(config *Config) {
	for _, window := range config.Windows {
		fmt.Println("new window ", window.Name)
		cmd := exec.Command("tmux", "neww", "-n", window.Name)
		err := cmd.Run()
		if err != nil {
			fmt.Println(err)
		}
		if window.Command != nil {
			cmd := exec.Command("tmux", "send-keys", "-t", window.Name, *window.Command)
			err := cmd.Run()
			if err != nil {
				fmt.Println(err)
			}

		}
		if len(window.Panels) > 0 {
			for _, panel := range window.Panels {
				cmd := exec.Command("tmux", "split-window", fmt.Sprintf("-%s", panel.Direction), "-t", window.Name)
				err := cmd.Run()
				if err != nil {
					fmt.Println(err)
				}
				if panel.Command != nil {
					cmd := exec.Command("tmux", "send-keys", "-t", window.Name, *panel.Command)
					err := cmd.Run()
					if err != nil {
						fmt.Println(err)
					}
				}
				if len(panel.Children) > 0 {
					for _, childPanel := range panel.Children {
						cmd := exec.Command("tmux", "split-window", fmt.Sprintf("-%s", childPanel.Direction), "-t", window.Name)
						err := cmd.Run()
						if err != nil {
							fmt.Println(err)
						}

						if panel.Command != nil {
							exec.Command("tmux", "send-keys", "-t", window.Name, *childPanel.Command)
						}
					}
				}
			}
		}
	}
}
