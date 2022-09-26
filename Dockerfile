FROM golang:1.17.6-alpine3.14 as base
WORKDIR /usr/src
COPY . .
ENV CGO_ENABLED=0
RUN GOOS=linux go build ./main.go

FROM scratch
WORKDIR /usr/src
COPY --from=base /usr/src/main .
CMD ["/usr/src/main"]