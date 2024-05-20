package main

import (
	"fmt"
	"os"
	"time"
)

func main() {
	fmt.Printf("Hello, %s\n", os.Args[1])
	time := time.Now().UTC()
	fmt.Printf("The time is %s\n", time)
}