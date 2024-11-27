FROM golang:1.20 AS builder
WORKDIR /go
COPY . .
RUN go build main.go

FROM scratch
WORKDIR /usr/local/share/
COPY --from=builder /go/main /usr/local/share/
ENTRYPOINT [ "./main" ]
