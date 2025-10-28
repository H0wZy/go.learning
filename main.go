package main

import "fmt"

func main() {
	var firstname, lastname string
	fmt.Println("Enter your firstname")
	fmt.Scan(&firstname)
	fmt.Printf("you choose: %s\n", firstname)
	fmt.Println("Ok, now enter your lastname")
	fmt.Scan(&lastname)
	fmt.Printf("you choose: %s\n", lastname)
	fmt.Println("Hello and welcome", firstname, lastname)
}
