package tmuxlayout

import (
	"fmt"
)

func TmuxLayout(config *Config) {
	if config.Command != "" {
		_, err := runTmuxCommand("send-keys", "-t", "1", config.Command)
		if err != nil {
			panic(err)
		}
	}

	if len(config.Windows) > 0 {
		for windowIndex, window := range config.Windows {

            // for the first window, we dont need to create it
			if windowIndex != 0 {
				fmt.Println("new window ", window.Name)
				_, err := runTmuxCommand("neww", "-n", window.Name)
				if err != nil {
					panic(err)
				}
			}

			if window.Command != nil {
				_, err := runTmuxCommand("send-keys", "-t", window.Name, *window.Command)
				if err != nil {
					panic(err)
				}

			}
			if len(window.Panels) > 0 {
				for _, panel := range window.Panels {
					_, err := runTmuxCommand("split-window", fmt.Sprintf("-%s", panel.Direction), "-t", window.Name)
					if err != nil {
						panic(err)
					}
					if panel.Command != nil {
						_, err := runTmuxCommand("send-keys", "-t", window.Name, *panel.Command)
						if err != nil {
							panic(err)
						}
					}
					if len(panel.Children) > 0 {
						for _, childPanel := range panel.Children {
							_, err := runTmuxCommand("split-window", fmt.Sprintf("-%s", childPanel.Direction), "-t", window.Name)
							if err != nil {
								panic(err)
							}

							if panel.Command != nil {
								_, err := runTmuxCommand("send-keys", "-t", window.Name, *childPanel.Command)
								if err != nil {
									panic(err)
								}
							}
						}
					}
				}
			}
		}
	}

	//focus first window
	focusWindow := 1
	if config.Focus != 0 {
		focusWindow = config.Focus
	}

	_, err := runTmuxCommand("select-window", "-t", fmt.Sprint(focusWindow))
	if err != nil {
		fmt.Println(err)
	}

}
