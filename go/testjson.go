package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"os"
)

type Config struct {
	Application string `json:"application"`
	Version     string `json:"version"`
	Port        int    `json:"port"`
	Debug       bool   `json:"debug"`
}

func main() {
	fileName := flag.String("f", "", "Path to JSON file")
	flag.Parse()

	if *fileName == "" {
		fmt.Fprintln(os.Stderr, "Error: JSON file must be provided with -f")
		os.Exit(1)
	}

	data, err := os.ReadFile(*fileName)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error reading file: %v\n", err)
		os.Exit(1)
	}

	// Validate JSON syntax
	if !json.Valid(data) {
		fmt.Fprintln(os.Stderr, "Error: Invalid JSON format")
		os.Exit(1)
	}

	var cfg Config
	if err := json.Unmarshal(data, &cfg); err != nil {
		fmt.Fprintf(os.Stderr, "Error parsing JSON: %v\n", err)
		os.Exit(1)
	}

	fmt.Println("JSON validation successful.")
	fmt.Println()

	prettyJSON, err := json.MarshalIndent(cfg, "", "  ")
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error formatting JSON: %v\n", err)
		os.Exit(1)
	}

	fmt.Println(string(prettyJSON))
}
