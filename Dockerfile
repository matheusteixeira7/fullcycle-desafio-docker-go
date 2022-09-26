FROM go:1.19.1-alpine3.16 as builder
WORKDIR /app
COPY . .
RUN go build -o main .

FROM alpine:3.16.2
WORKDIR /app
COPY --from=builder /app .
EXPOSE 8080
CMD ["/app/main"]
