# No primeiro estagio é utilizado o container do golang para buildar o arquivo e gerar o binário
FROM golang:1.20 as builder
WORKDIR /go/src/app
COPY fullcycle.go .
RUN go build fullcycle.go

#No segundo estagio é executado o binário
FROM alpine:3.17
COPY --from=builder /go/src/app/fullcycle /bin
CMD fullcycle