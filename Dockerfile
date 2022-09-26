FROM golang:1.16-alpine AS builder

WORKDIR /usr/src/app
COPY . .
RUN go build -o file/binary main.go

FROM scratch

COPY --from=builder /usr/src/app/file .
CMD ["./binary"]