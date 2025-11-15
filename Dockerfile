# Given build
# I'm not going to make you all fight with compiling go
FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY . .
RUN go build -o server .

# Step 2: Run
FROM alpine:3.20
WORKDIR /app
COPY --from=builder /app/server . 
EXPOSE 8080
CMD ["./server"]

# TODO: 
    # DONE:     set WORKDIR to the /app directory 
    # DONE:     copy our current directory to /app/server (hint - use --from=builder)
    # DONE:     expose port 8080 
    # DONE:     run our server using CMD and ./server
