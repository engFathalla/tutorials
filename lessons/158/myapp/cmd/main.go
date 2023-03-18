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

	duration := time.Duration(*interval)

	for {
		rId := uuid.New()
		uId := uuid.New()
		msg := fmt.Sprintf("request id %s, user %s", rId, uId)

		log.Println(msg)
		time.Sleep(duration * time.Millisecond)
	}
}
