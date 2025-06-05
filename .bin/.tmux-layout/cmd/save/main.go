package main

import (
    "tmux-layout.com/pkg/tmuxlayout"
)

func main() {// Get the current working directory
	// cwd, err := os.Getwd()
	// if err != nil {
	// 	log.Fatal(err)
	// }
	//
	// // Define the path for the .tmux-layout file in the current working directory
	// path := fmt.Sprint(cwd, "/.tmux-layout")

	// Call the SaveTmuxLayout function to save the current tmux layout to the file
	tmuxlayout.SaveTmuxLayout()

	// fmt.Printf("Tmux layout saved to %s\n", path)
}

