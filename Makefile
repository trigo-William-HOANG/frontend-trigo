# Run Vue.js development server
run-frontend:
	npm run dev

# Run Go backend server
run-backend:
	cd backend && go run main.go

# Run both servers concurrently
run-all:
	make run-backend & make run-frontend

# Stop Go backend server
stop-backend:
	pkill -f "go run main.go" || true

.PHONY: run-frontend run-backend run-all stop-backend
