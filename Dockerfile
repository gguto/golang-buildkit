# No primeiro estagio é utilizado o container do golang para buildar o arquivo e gerar o binário
FROM golang:1.20 as builder
WORKDIR /go/src/app
ADD . .
RUN go build fullcycle.go

#No segundo estagio é executado o binário
FROM scratch   
COPY --from=builder /go/src/app/fullcycle /go/src/app/fullcycle
ENTRYPOINT ["/go/src/app/fullcycle"]