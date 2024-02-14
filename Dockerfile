# Stage 1: Build the application
FROM node:14 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .


# Stage 2: Serve the application with Alpine
FROM alpine:3.14
RUN apk add --no-cache nodejs
COPY --from=builder /app ./
CMD ["node", "server.js"]
