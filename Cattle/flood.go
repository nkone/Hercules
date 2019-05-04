package main

import (
	"net/http"
	"fmt"
	"os"
	"strconv"
	"time"
)

func main() {
	if len(os.Args) != 3 {
		fmt.Println("usage: flood no_of_attack url")
	} else {
		no_req, err := strconv.Atoi(os.Args[1])
		if err != nil {
			fmt.Println("Error: wrong integer input for argument 1")
			} else {
			MakeRequest(no_req, os.Args[2])
			}
		}
}

func MakeRequest(no_req int, url string) {
	var success, failure, i = 0, 0 ,0
	start := time.Now()
	for (i < no_req) {
		resp, err := http.Get(url)
		if err != nil {
			fmt.Println("Error: invalid url or an unexpected error has occured")
			os.Exit(3)
		}
	status := resp.StatusCode
		if status < 400 {
			success++
		} else {
			failure++
		}
		i++
	}
	elapse := time.Since(start).Seconds()
	attack_speed := float64(no_req) / float64(elapse)
	avg_time := float64(elapse) / float64(no_req)
	success_rate := (float64(success)/float64(no_req))*100
	fmt.Printf("Total time elapsed: %.2fs \n", elapse)
	fmt.Printf("Transaction speed: %.f hits/s\n", attack_speed)
	fmt.Printf("Average time per trans: %.4fs/hit \n", avg_time)
	fmt.Printf("Successful transactions: %v hits\n", success)
	fmt.Printf("Failed transactions: %v hits\n", failure)
	fmt.Printf("Success rate: %.2f%%\n", success_rate)
}
