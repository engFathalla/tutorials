package main

import (
	"flag"
	"fmt"
	"log"
	"time"

	"github.com/google/uuid"
)

func main() {
	interval := flag.Int("interval", 200, "interval to sleep")
	flag.Parse()

	id := uuid.New()
	msg := fmt.Sprintf("request id %s", id)

	duration := time.Duration(*interval)

	for {
		log.Println(msg)
		time.Sleep(duration * time.Millisecond)
	}
}
