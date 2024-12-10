package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/test", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello from the backend!")
	})

	// ...existing code...

	http.ListenAndServe(":8080", nil)
}
