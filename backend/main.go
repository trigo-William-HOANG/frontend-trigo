package main

import (
	"encoding/json"
	"net/http"

	"github.com/rs/cors"
)

func main() {
	http.HandleFunc("/api/message", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(map[string]string{
			"message": "test",
		})
	})

	handler := cors.Default().Handler(http.DefaultServeMux)
	http.ListenAndServe(":8080", handler)
}
