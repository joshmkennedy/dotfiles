package main

import (
	"errors"
	"fmt"
	"log"
	"os"

	"github.com/BurntSushi/toml"
)

func main() {
	// 1. get file contents (.tmux-layout)
	cwd, err := os.Getwd()
	if err != nil {
		log.Fatal(err)
	}

	var path string
	if len(os.Args) < 2 {
		path = fmt.Sprint(cwd, "/.tmux-layout")
	} else {
		path = os.Args[1]
	}

	if _, err = os.Stat(path); err != nil {
		if errors.Is(err, os.ErrNotExist) {
			os.Exit(1)
		} else {
			log.Fatal(err)
		}
	}

	raw, err := os.ReadFile(path)
	if err != nil {
		log.Fatalf("couldnt read %s,\n %e", path, err)
	}

	// 2. parse file
	config := parseConfig(raw)

	fmt.Printf("%+v\n", config)
	// 4. execute program and create windows and panels
	TmuxLayout(config)
}

func parseConfig(contents []byte) *Config {
	var config Config
	_, err := toml.Decode(string(contents), &config)
	if err != nil {
		fmt.Println(err)
	}
	return &config
}
