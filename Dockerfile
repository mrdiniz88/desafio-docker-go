FROM golang:1.19-alpine as builder

WORKDIR /usr/app

COPY . .
RUN go mod init main && go build


FROM scratch
WORKDIR /app
COPY --from=builder /usr/app/main .
CMD ["/app/main"]