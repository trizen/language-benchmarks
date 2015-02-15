package main

import (
	"fmt"
	"os"
	"strconv"
)

func fib(n int) int {
	if n > 1 {
		return fib(n-1) + fib(n-2)
	}
	return n
}

func main() {
	n, _ := strconv.Atoi(os.Args[1])
	fmt.Println(fib(n))
}
