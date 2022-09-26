FROM golang:1.19.1-alpine as builder
WORKDIR /app
COPY . .
RUN go build -o main .

FROM scratch
WORKDIR /app
COPY --from=builder /app .
EXPOSE 8080
CMD ["/app/main"]
