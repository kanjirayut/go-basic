# Base Image Golang 1.22.5
FROM golang:1.22.5-alpine

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Set environment variables
# ENV DB_HOST=pgdb
# ENV DB_PORT=5432
# ENV DB_NAME=gosampledb
# ENV DB_USER=kanjirayut
# ENV DB_PASSWORD=postgres
# ENV DB_SSLMODE=disable
# ENV DB_TIMEZONE=UTC
# ENV DB_CONNECT_TIMEOUT=5
# ENV JWT_SECRET=verysecret
# ENV JWT_ISSUER=example.com
# ENV JWT_AUDIENCE=example.com
# ENV COOKIE_DOMAIN=localhost
# ENV DOMAIN=example.com
# ENV API_KEY=b41447e6319d1cd467306735632ba733

#Render
ENV DB_HOST=dpg-cttuet8gph6c738n5d60-a
ENV DB_PORT=5432
ENV DB_NAME=gosampledb_0vbc
ENV DB_USER=gosampledb_user
ENV DB_PASSWORD=iaGaJgwbbViujQO4ISj2dsFqVh4K8igs
ENV DB_SSLMODE=disable
ENV DB_TIMEZONE=UTC
ENV DB_CONNECT_TIMEOUT=5
ENV JWT_SECRET=verysecret
ENV JWT_ISSUER=example.com
ENV JWT_AUDIENCE=example.com
ENV COOKIE_DOMAIN=localhost
ENV DOMAIN=example.com
ENV API_KEY=b41447e6319d1cd467306735632ba733

# Build the Go app
RUN go build -o main ./cmd/api

# Make the executable file
RUN chmod +x main

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./main"]